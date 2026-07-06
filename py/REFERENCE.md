# Pokapi Python SDK Reference

Complete API reference for the Pokapi Python SDK.


## PokapiSDK

### Constructor

```python
from pokapi_sdk import PokapiSDK

client = PokapiSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PokapiSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = PokapiSDK.test()
```


### Instance Methods

#### `Ability(data=None)`

Create a new `AbilityEntity` instance. Pass `None` for no initial data.

#### `PaginatedResourceList(data=None)`

Create a new `PaginatedResourceListEntity` instance. Pass `None` for no initial data.

#### `Pokemon(data=None)`

Create a new `PokemonEntity` instance. Pass `None` for no initial data.

#### `PokemonSpecies(data=None)`

Create a new `PokemonSpeciesEntity` instance. Pass `None` for no initial data.

#### `Type(data=None)`

Create a new `TypeEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## AbilityEntity

```python
ability = client.Ability()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `effect_entry` | `list` | No |  |
| `generation` | `dict` | No |  |
| `id` | `int` | No |  |
| `is_main_series` | `bool` | No |  |
| `name` | `str` | No |  |
| `pokemon` | `list` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Ability().load({"id": "ability_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `AbilityEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PaginatedResourceListEntity

```python
paginated_resource_list = client.PaginatedResourceList()
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PaginatedResourceListEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PokemonEntity

```python
pokemon = client.Pokemon()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ability` | `list` | No |  |
| `base_experience` | `int` | No |  |
| `form` | `list` | No |  |
| `game_index` | `list` | No |  |
| `height` | `int` | No |  |
| `held_item` | `list` | No |  |
| `id` | `int` | No |  |
| `is_default` | `bool` | No |  |
| `location_area` | `dict` | No |  |
| `location_area_encounter` | `str` | No |  |
| `mof` | `list` | No |  |
| `name` | `str` | No |  |
| `order` | `int` | No |  |
| `species` | `dict` | No |  |
| `sprite` | `dict` | No |  |
| `stat` | `list` | No |  |
| `type` | `list` | No |  |
| `url` | `str` | No |  |
| `version_detail` | `list` | No |  |
| `weight` | `int` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Pokemon().list()
for pokemon in results:
    print(pokemon)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Pokemon().load({"id": "pokemon_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PokemonEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PokemonSpeciesEntity

```python
pokemon_species = client.PokemonSpecies()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `base_happiness` | `int` | No |  |
| `capture_rate` | `int` | No |  |
| `forms_switchable` | `bool` | No |  |
| `gender_rate` | `int` | No |  |
| `has_gender_difference` | `bool` | No |  |
| `hatch_counter` | `int` | No |  |
| `id` | `int` | No |  |
| `is_baby` | `bool` | No |  |
| `is_legendary` | `bool` | No |  |
| `is_mythical` | `bool` | No |  |
| `name` | `str` | No |  |
| `order` | `int` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.PokemonSpecies().load({"id": "pokemon_species_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PokemonSpeciesEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## TypeEntity

```python
type = client.Type()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `damage_relation` | `dict` | No |  |
| `game_index` | `list` | No |  |
| `generation` | `dict` | No |  |
| `id` | `int` | No |  |
| `move_damage_class` | `dict` | No |  |
| `name` | `str` | No |  |
| `pokemon` | `list` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Type().load({"id": "type_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `TypeEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = PokapiSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

