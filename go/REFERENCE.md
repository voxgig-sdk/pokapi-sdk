# Pokapi Golang SDK Reference

Complete API reference for the Pokapi Golang SDK.


## PokapiSDK

### Constructor

```go
func NewPokapiSDK(options map[string]any) *PokapiSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *PokapiSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *PokapiSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Ability(data map[string]any) PokapiEntity`

Create a new `Ability` entity instance. Pass `nil` for no initial data.

#### `PaginatedResourceList(data map[string]any) PokapiEntity`

Create a new `PaginatedResourceList` entity instance. Pass `nil` for no initial data.

#### `Pokemon(data map[string]any) PokapiEntity`

Create a new `Pokemon` entity instance. Pass `nil` for no initial data.

#### `PokemonSpecies(data map[string]any) PokapiEntity`

Create a new `PokemonSpecies` entity instance. Pass `nil` for no initial data.

#### `Type(data map[string]any) PokapiEntity`

Create a new `Type` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## AbilityEntity

```go
ability := client.Ability(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `effect_entry` | ``$ARRAY`` | No |  |
| `generation` | ``$OBJECT`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `is_main_series` | ``$BOOLEAN`` | No |  |
| `name` | ``$STRING`` | No |  |
| `pokemon` | ``$ARRAY`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Ability(nil).Load(map[string]any{"id": "ability_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `AbilityEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PaginatedResourceListEntity

```go
paginated_resource_list := client.PaginatedResourceList(nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PaginatedResourceListEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PokemonEntity

```go
pokemon := client.Pokemon(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ability` | ``$ARRAY`` | No |  |
| `base_experience` | ``$INTEGER`` | No |  |
| `form` | ``$ARRAY`` | No |  |
| `game_index` | ``$ARRAY`` | No |  |
| `height` | ``$INTEGER`` | No |  |
| `held_item` | ``$ARRAY`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `is_default` | ``$BOOLEAN`` | No |  |
| `location_area` | ``$OBJECT`` | No |  |
| `location_area_encounter` | ``$STRING`` | No |  |
| `mof` | ``$ARRAY`` | No |  |
| `name` | ``$STRING`` | No |  |
| `order` | ``$INTEGER`` | No |  |
| `species` | ``$OBJECT`` | No |  |
| `sprite` | ``$OBJECT`` | No |  |
| `stat` | ``$ARRAY`` | No |  |
| `type` | ``$ARRAY`` | No |  |
| `url` | ``$STRING`` | No |  |
| `version_detail` | ``$ARRAY`` | No |  |
| `weight` | ``$INTEGER`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Pokemon(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Pokemon(nil).Load(map[string]any{"id": "pokemon_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PokemonEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PokemonSpeciesEntity

```go
pokemon_species := client.PokemonSpecies(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `base_happiness` | ``$INTEGER`` | No |  |
| `capture_rate` | ``$INTEGER`` | No |  |
| `forms_switchable` | ``$BOOLEAN`` | No |  |
| `gender_rate` | ``$INTEGER`` | No |  |
| `has_gender_difference` | ``$BOOLEAN`` | No |  |
| `hatch_counter` | ``$INTEGER`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `is_baby` | ``$BOOLEAN`` | No |  |
| `is_legendary` | ``$BOOLEAN`` | No |  |
| `is_mythical` | ``$BOOLEAN`` | No |  |
| `name` | ``$STRING`` | No |  |
| `order` | ``$INTEGER`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.PokemonSpecies(nil).Load(map[string]any{"id": "pokemon_species_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PokemonSpeciesEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## TypeEntity

```go
type := client.Type(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `damage_relation` | ``$OBJECT`` | No |  |
| `game_index` | ``$ARRAY`` | No |  |
| `generation` | ``$OBJECT`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `move_damage_class` | ``$OBJECT`` | No |  |
| `name` | ``$STRING`` | No |  |
| `pokemon` | ``$ARRAY`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Type(nil).Load(map[string]any{"id": "type_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `TypeEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewPokapiSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

