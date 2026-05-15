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
| `options["apikey"]` | `str` | API key for authentication. |
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

#### `direct(fetchargs=None) -> tuple`

Make a direct HTTP request to any API endpoint. Returns `(result, err)`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `(result_dict, err)`

#### `prepare(fetchargs=None) -> tuple`

Prepare a fetch definition without sending. Returns `(fetchdef, err)`.


---

## AbilityEntity

```python
ability = client.Ability()
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

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Ability().load({"id": "ability_id"})
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

#### `list(reqmatch, ctrl=None) -> tuple`

List entities matching the given criteria. Returns an array.

```python
results, err = client.Pokemon().list({})
```

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Pokemon().load({"id": "pokemon_id"})
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

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.PokemonSpecies().load({"id": "pokemon_species_id"})
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
| `damage_relation` | ``$OBJECT`` | No |  |
| `game_index` | ``$ARRAY`` | No |  |
| `generation` | ``$OBJECT`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `move_damage_class` | ``$OBJECT`` | No |  |
| `name` | ``$STRING`` | No |  |
| `pokemon` | ``$ARRAY`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> tuple`

Load a single entity matching the given criteria.

```python
result, err = client.Type().load({"id": "type_id"})
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

