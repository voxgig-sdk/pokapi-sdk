package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/pokapi-sdk"
	"github.com/voxgig-sdk/pokapi-sdk/core"

	vs "github.com/voxgig/struct"
)

func TestPokemonSpeciesEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.PokemonSpecies(nil)
		if ent == nil {
			t.Fatal("expected non-nil PokemonSpeciesEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := pokemon_speciesBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"load"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "pokemon_species." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set POKAPI_TEST_POKEMON_SPECIES_ENTID JSON to run live")
			return
		}
		client := setup.client

		// Bootstrap entity data from existing test data (no create step in flow).
		pokemonSpeciesRef01DataRaw := vs.Items(core.ToMapAny(vs.GetPath("existing.pokemon_species", setup.data)))
		var pokemonSpeciesRef01Data map[string]any
		if len(pokemonSpeciesRef01DataRaw) > 0 {
			pokemonSpeciesRef01Data = core.ToMapAny(pokemonSpeciesRef01DataRaw[0][1])
		}
		// Discard guards against Go's unused-var check when the flow's steps
		// happen not to consume the bootstrap data (e.g. list-only flows).
		_ = pokemonSpeciesRef01Data

		// LOAD
		pokemonSpeciesRef01Ent := client.PokemonSpecies(nil)
		pokemonSpeciesRef01MatchDt0 := map[string]any{
			"id": pokemonSpeciesRef01Data["id"],
		}
		pokemonSpeciesRef01DataDt0Loaded, err := pokemonSpeciesRef01Ent.Load(pokemonSpeciesRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		pokemonSpeciesRef01DataDt0LoadResult := core.ToMapAny(pokemonSpeciesRef01DataDt0Loaded)
		if pokemonSpeciesRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if pokemonSpeciesRef01DataDt0LoadResult["id"] != pokemonSpeciesRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

	})
}

func pokemon_speciesBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "pokemon_species", "PokemonSpeciesTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read pokemon_species test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse pokemon_species test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"pokemon_species01", "pokemon_species02", "pokemon_species03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("POKAPI_TEST_POKEMON_SPECIES_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"POKAPI_TEST_POKEMON_SPECIES_ENTID": idmap,
		"POKAPI_TEST_LIVE":      "FALSE",
		"POKAPI_TEST_EXPLAIN":   "FALSE",
		"POKAPI_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["POKAPI_TEST_POKEMON_SPECIES_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["POKAPI_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["POKAPI_APIKEY"],
			},
			extra,
		})
		client = sdk.NewPokapiSDK(core.ToMapAny(mergedOpts))
	}

	live := env["POKAPI_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["POKAPI_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
