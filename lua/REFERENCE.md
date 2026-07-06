# Pokapi Lua SDK Reference

Complete API reference for the Pokapi Lua SDK.


## PokapiSDK

### Constructor

```lua
local sdk = require("pokapi_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Ability(data)`

Create a new `Ability` entity instance. Pass `nil` for no initial data.

#### `PaginatedResourceList(data)`

Create a new `PaginatedResourceList` entity instance. Pass `nil` for no initial data.

#### `Pokemon(data)`

Create a new `Pokemon` entity instance. Pass `nil` for no initial data.

#### `PokemonSpecies(data)`

Create a new `PokemonSpecies` entity instance. Pass `nil` for no initial data.

#### `Type(data)`

Create a new `Type` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## AbilityEntity

```lua
local ability = client:Ability(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `effect_entry` | `table` | No |  |
| `generation` | `table` | No |  |
| `id` | `number` | No |  |
| `is_main_series` | `boolean` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Ability():load({ id = "ability_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AbilityEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PaginatedResourceListEntity

```lua
local paginated_resource_list = client:PaginatedResourceList(nil)
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PaginatedResourceListEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PokemonEntity

```lua
local pokemon = client:Pokemon(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ability` | `table` | No |  |
| `base_experience` | `number` | No |  |
| `form` | `table` | No |  |
| `game_index` | `table` | No |  |
| `height` | `number` | No |  |
| `held_item` | `table` | No |  |
| `id` | `number` | No |  |
| `is_default` | `boolean` | No |  |
| `location_area` | `table` | No |  |
| `location_area_encounter` | `string` | No |  |
| `mof` | `table` | No |  |
| `name` | `string` | No |  |
| `order` | `number` | No |  |
| `species` | `table` | No |  |
| `sprite` | `table` | No |  |
| `stat` | `table` | No |  |
| `type` | `table` | No |  |
| `url` | `string` | No |  |
| `version_detail` | `table` | No |  |
| `weight` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Pokemon():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Pokemon():load({ id = "pokemon_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PokemonEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PokemonSpeciesEntity

```lua
local pokemon_species = client:PokemonSpecies(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `base_happiness` | `number` | No |  |
| `capture_rate` | `number` | No |  |
| `forms_switchable` | `boolean` | No |  |
| `gender_rate` | `number` | No |  |
| `has_gender_difference` | `boolean` | No |  |
| `hatch_counter` | `number` | No |  |
| `id` | `number` | No |  |
| `is_baby` | `boolean` | No |  |
| `is_legendary` | `boolean` | No |  |
| `is_mythical` | `boolean` | No |  |
| `name` | `string` | No |  |
| `order` | `number` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:PokemonSpecies():load({ id = "pokemon_species_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PokemonSpeciesEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## TypeEntity

```lua
local type = client:Type(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `damage_relation` | `table` | No |  |
| `game_index` | `table` | No |  |
| `generation` | `table` | No |  |
| `id` | `number` | No |  |
| `move_damage_class` | `table` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Type():load({ id = "type_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TypeEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

