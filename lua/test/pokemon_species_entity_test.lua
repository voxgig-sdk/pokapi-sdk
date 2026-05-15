-- PokemonSpecies entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("pokapi_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

describe("PokemonSpeciesEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:PokemonSpecies(nil)
    assert.is_not_nil(ent)
  end)

  it("should run basic flow", function()
    local setup = pokemon_species_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"load"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "pokemon_species." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    -- The basic flow consumes synthetic IDs from the fixture. In live mode
    -- without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only then
      pending("live entity test uses synthetic IDs from fixture — set POKAPI_TEST_POKEMON_SPECIES_ENTID JSON to run live")
      return
    end
    local client = setup.client

    -- Bootstrap entity data from existing test data.
    local pokemon_species_ref01_data_raw = vs.items(helpers.to_map(
      vs.getpath(setup.data, "existing.pokemon_species")))
    local pokemon_species_ref01_data = nil
    if #pokemon_species_ref01_data_raw > 0 then
      pokemon_species_ref01_data = helpers.to_map(pokemon_species_ref01_data_raw[1][2])
    end

    -- LOAD
    local pokemon_species_ref01_ent = client:PokemonSpecies(nil)
    local pokemon_species_ref01_match_dt0 = {
      id = pokemon_species_ref01_data["id"],
    }
    local pokemon_species_ref01_data_dt0_loaded, err = pokemon_species_ref01_ent:load(pokemon_species_ref01_match_dt0, nil)
    assert.is_nil(err)
    local pokemon_species_ref01_data_dt0_load_result = helpers.to_map(pokemon_species_ref01_data_dt0_loaded)
    assert.is_not_nil(pokemon_species_ref01_data_dt0_load_result)
    assert.are.equal(pokemon_species_ref01_data_dt0_load_result["id"], pokemon_species_ref01_data["id"])

  end)
end)

function pokemon_species_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/pokemon_species/PokemonSpeciesTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read pokemon_species test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "pokemon_species01", "pokemon_species02", "pokemon_species03" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Detect ENTID env override before envOverride consumes it. When live
  -- mode is on without a real override, the basic test runs against synthetic
  -- IDs from the fixture and 4xx's. Surface this so the test can skip.
  local entid_env_raw = os.getenv("POKAPI_TEST_POKEMON_SPECIES_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["POKAPI_TEST_POKEMON_SPECIES_ENTID"] = idmap,
    ["POKAPI_TEST_LIVE"] = "FALSE",
    ["POKAPI_TEST_EXPLAIN"] = "FALSE",
    ["POKAPI_APIKEY"] = "NONE",
  })

  local idmap_resolved = helpers.to_map(
    env["POKAPI_TEST_POKEMON_SPECIES_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["POKAPI_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      {
        apikey = env["POKAPI_APIKEY"],
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["POKAPI_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["POKAPI_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
