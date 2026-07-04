# Pokapi Ruby SDK



The Ruby SDK for the Pokapi API — an entity-oriented client using idiomatic Ruby conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/pokapi-sdk/releases](https://github.com/voxgig-sdk/pokapi-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Pokapi_sdk"

client = PokapiSDK.new
```

### 3. Load an ability

```ruby
begin
  # load returns the bare Ability record (raises on error).
  ability = client.Ability.load({ "id" => "example_id" })
  puts ability
rescue => err
  warn "load failed: #{err}"
end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  warn result["err"]
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required. Seed fixture
data via the `entity` option so offline calls resolve without a live server:

```ruby
client = PokapiSDK.test({
  "entity" => { "ability" => { "test01" => { "id" => "test01" } } },
})

# load returns the bare mock record (raises on error).
ability = client.Ability.load({ "id" => "test01" })
puts ability
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = PokapiSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
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
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### PokapiSDK

```ruby
require_relative "Pokapi_sdk"
client = PokapiSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = PokapiSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### PokapiSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Ability` | `(data) -> AbilityEntity` | Create an Ability entity instance. |
| `PaginatedResourceList` | `(data) -> PaginatedResourceListEntity` | Create a PaginatedResourceList entity instance. |
| `Pokemon` | `(data) -> PokemonEntity` | Create a Pokemon entity instance. |
| `PokemonSpecies` | `(data) -> PokemonSpeciesEntity` | Create a PokemonSpecies entity instance. |
| `Type` | `(data) -> TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> Array` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `PokapiError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `ability = client.Ability`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `effect_entry` | ``$ARRAY`` |  |
| `generation` | ``$OBJECT`` |  |
| `id` | ``$INTEGER`` |  |
| `is_main_series` | ``$BOOLEAN`` |  |
| `name` | ``$STRING`` |  |
| `pokemon` | ``$ARRAY`` |  |

#### Example: Load

```ruby
# load returns the bare Ability record (raises on error).
ability = client.Ability.load({ "id" => "ability_id" })
```


### PaginatedResourceList

Create an instance: `paginated_resource_list = client.PaginatedResourceList`


### Pokemon

Create an instance: `pokemon = client.Pokemon`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `ability` | ``$ARRAY`` |  |
| `base_experience` | ``$INTEGER`` |  |
| `form` | ``$ARRAY`` |  |
| `game_index` | ``$ARRAY`` |  |
| `height` | ``$INTEGER`` |  |
| `held_item` | ``$ARRAY`` |  |
| `id` | ``$INTEGER`` |  |
| `is_default` | ``$BOOLEAN`` |  |
| `location_area` | ``$OBJECT`` |  |
| `location_area_encounter` | ``$STRING`` |  |
| `mof` | ``$ARRAY`` |  |
| `name` | ``$STRING`` |  |
| `order` | ``$INTEGER`` |  |
| `species` | ``$OBJECT`` |  |
| `sprite` | ``$OBJECT`` |  |
| `stat` | ``$ARRAY`` |  |
| `type` | ``$ARRAY`` |  |
| `url` | ``$STRING`` |  |
| `version_detail` | ``$ARRAY`` |  |
| `weight` | ``$INTEGER`` |  |

#### Example: Load

```ruby
# load returns the bare Pokemon record (raises on error).
pokemon = client.Pokemon.load({ "id" => "pokemon_id" })
```

#### Example: List

```ruby
# list returns an Array of Pokemon records (raises on error).
pokemons = client.Pokemon.list
```


### PokemonSpecies

Create an instance: `pokemon_species = client.PokemonSpecies`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `base_happiness` | ``$INTEGER`` |  |
| `capture_rate` | ``$INTEGER`` |  |
| `forms_switchable` | ``$BOOLEAN`` |  |
| `gender_rate` | ``$INTEGER`` |  |
| `has_gender_difference` | ``$BOOLEAN`` |  |
| `hatch_counter` | ``$INTEGER`` |  |
| `id` | ``$INTEGER`` |  |
| `is_baby` | ``$BOOLEAN`` |  |
| `is_legendary` | ``$BOOLEAN`` |  |
| `is_mythical` | ``$BOOLEAN`` |  |
| `name` | ``$STRING`` |  |
| `order` | ``$INTEGER`` |  |

#### Example: Load

```ruby
# load returns the bare PokemonSpecies record (raises on error).
pokemon_species = client.PokemonSpecies.load({ "id" => "pokemon_species_id" })
```


### Type

Create an instance: `type = client.Type`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `damage_relation` | ``$OBJECT`` |  |
| `game_index` | ``$ARRAY`` |  |
| `generation` | ``$OBJECT`` |  |
| `id` | ``$INTEGER`` |  |
| `move_damage_class` | ``$OBJECT`` |  |
| `name` | ``$STRING`` |  |
| `pokemon` | ``$ARRAY`` |  |

#### Example: Load

```ruby
# load returns the bare Type record (raises on error).
type = client.Type.load({ "id" => "type_id" })
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

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

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller as a second return value.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Pokapi_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Pokapi_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```ruby
ability = client.Ability
ability.load({ "id" => "example_id" })

# ability.data_get now returns the loaded ability data
# ability.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
