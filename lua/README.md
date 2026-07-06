# Pokapi Lua SDK



The Lua SDK for the Pokapi API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:Ability()` — each with the same small set of operations (`list`, `load`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/pokapi-sdk/releases)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```lua
local sdk = require("pokapi_sdk")

local client = sdk.new()
```

### 3. Load an ability

```lua
local ability, err = client:Ability():load({ id = "example_id" })
if err then error(err) end
print(ability)
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local ability, err = client:Ability():load({ id = "example_id" })
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:Ability():load({ id = "test01" })
-- result is the returned data; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
POKAPI_TEST_LIVE=TRUE
```

Then run:

```bash
cd lua && busted test/
```


## Reference

### PokapiSDK

```lua
local sdk = require("pokapi_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### PokapiSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
| `Ability` | `(data) -> AbilityEntity` | Create an Ability entity instance. |
| `PaginatedResourceList` | `(data) -> PaginatedResourceListEntity` | Create a PaginatedResourceList entity instance. |
| `Pokemon` | `(data) -> PokemonEntity` | Create a Pokemon entity instance. |
| `PokemonSpecies` | `(data) -> PokemonSpeciesEntity` | Create a PokemonSpecies entity instance. |
| `Type` | `(data) -> TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any, err` | Load a single entity by match criteria. |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the operation's
data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `load` | the entity record (a `table`) |
| `list` | an array (`table`) of entity records |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local ability, err = client:Ability():load({ id = "example_id" })
    if err then error(err) end
    -- ability is the loaded record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

### Entities

#### Ability

| Field | Description |
| --- | --- |
| `effect_entry` |  |
| `generation` |  |
| `id` |  |
| `is_main_series` |  |
| `name` |  |
| `pokemon` |  |

Operations: Load.

API path: `/ability/{idOrName}`

#### PaginatedResourceList

| Field | Description |
| --- | --- |

Operations: .

API path: ``

#### Pokemon

| Field | Description |
| --- | --- |
| `ability` |  |
| `base_experience` |  |
| `form` |  |
| `game_index` |  |
| `height` |  |
| `held_item` |  |
| `id` |  |
| `is_default` |  |
| `location_area` |  |
| `location_area_encounter` |  |
| `mof` |  |
| `name` |  |
| `order` |  |
| `species` |  |
| `sprite` |  |
| `stat` |  |
| `type` |  |
| `url` |  |
| `version_detail` |  |
| `weight` |  |

Operations: List, Load.

API path: `/pokemon`

#### PokemonSpecies

| Field | Description |
| --- | --- |
| `base_happiness` |  |
| `capture_rate` |  |
| `forms_switchable` |  |
| `gender_rate` |  |
| `has_gender_difference` |  |
| `hatch_counter` |  |
| `id` |  |
| `is_baby` |  |
| `is_legendary` |  |
| `is_mythical` |  |
| `name` |  |
| `order` |  |

Operations: Load.

API path: `/pokemon-species/{idOrName}`

#### Type

| Field | Description |
| --- | --- |
| `damage_relation` |  |
| `game_index` |  |
| `generation` |  |
| `id` |  |
| `move_damage_class` |  |
| `name` |  |
| `pokemon` |  |

Operations: Load.

API path: `/type/{idOrName}`



## Entities


### Ability

Create an instance: `local ability = client:Ability(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `effect_entry` | `table` |  |
| `generation` | `table` |  |
| `id` | `number` |  |
| `is_main_series` | `boolean` |  |
| `name` | `string` |  |
| `pokemon` | `table` |  |

#### Example: Load

```lua
local ability, err = client:Ability():load({ id = "ability_id" })
```


### PaginatedResourceList

Create an instance: `local paginated_resource_list = client:PaginatedResourceList(nil)`


### Pokemon

Create an instance: `local pokemon = client:Pokemon(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ability` | `table` |  |
| `base_experience` | `number` |  |
| `form` | `table` |  |
| `game_index` | `table` |  |
| `height` | `number` |  |
| `held_item` | `table` |  |
| `id` | `number` |  |
| `is_default` | `boolean` |  |
| `location_area` | `table` |  |
| `location_area_encounter` | `string` |  |
| `mof` | `table` |  |
| `name` | `string` |  |
| `order` | `number` |  |
| `species` | `table` |  |
| `sprite` | `table` |  |
| `stat` | `table` |  |
| `type` | `table` |  |
| `url` | `string` |  |
| `version_detail` | `table` |  |
| `weight` | `number` |  |

#### Example: Load

```lua
local pokemon, err = client:Pokemon():load({ id = "pokemon_id" })
```

#### Example: List

```lua
local pokemons, err = client:Pokemon():list()
```


### PokemonSpecies

Create an instance: `local pokemon_species = client:PokemonSpecies(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `base_happiness` | `number` |  |
| `capture_rate` | `number` |  |
| `forms_switchable` | `boolean` |  |
| `gender_rate` | `number` |  |
| `has_gender_difference` | `boolean` |  |
| `hatch_counter` | `number` |  |
| `id` | `number` |  |
| `is_baby` | `boolean` |  |
| `is_legendary` | `boolean` |  |
| `is_mythical` | `boolean` |  |
| `name` | `string` |  |
| `order` | `number` |  |

#### Example: Load

```lua
local pokemon_species, err = client:PokemonSpecies():load({ id = "pokemon_species_id" })
```


### Type

Create an instance: `local type = client:Type(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `damage_relation` | `table` |  |
| `game_index` | `table` |  |
| `generation` | `table` |  |
| `id` | `number` |  |
| `move_damage_class` | `table` |  |
| `name` | `string` |  |
| `pokemon` | `table` |  |

#### Example: Load

```lua
local type, err = client:Type():load({ id = "type_id" })
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── pokapi_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`pokapi_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```lua
local ability = client:Ability()
ability:load({ id = "example_id" })

-- ability:data_get() now returns the ability data from the last load
-- ability:match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
