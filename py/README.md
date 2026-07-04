# Pokapi Python SDK



The Python SDK for the Pokapi API — an entity-oriented client following Pythonic conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/pokapi-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
from pokapi_sdk import PokapiSDK

client = PokapiSDK()
```

### 3. Load an ability

```python
try:
    result = client.ability.load({"id": "example_id"})
    print(result)
except Exception as err:
    print(f"load failed: {err}")
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    print(result["err"])     # error value
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = PokapiSDK.test()

result = client.ability.load({"id": "test01"})
# result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = PokapiSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
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
cd py && pytest test/
```


## Reference

### PokapiSDK

```python
from pokapi_sdk import PokapiSDK

client = PokapiSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = PokapiSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### PokapiSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
| `Ability` | `(data) -> AbilityEntity` | Create a Ability entity instance. |
| `PaginatedResourceList` | `(data) -> PaginatedResourceListEntity` | Create a PaginatedResourceList entity instance. |
| `Pokemon` | `(data) -> PokemonEntity` | Create a Pokemon entity instance. |
| `PokemonSpecies` | `(data) -> PokemonSpeciesEntity` | Create a PokemonSpecies entity instance. |
| `Type` | `(data) -> TypeEntity` | Create a Type entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

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

Create an instance: `const ability = client.ability`

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

```ts
const ability = await client.ability.load({ id: 'ability_id' })
```


### PaginatedResourceList

Create an instance: `const paginated_resource_list = client.paginated_resource_list`


### Pokemon

Create an instance: `const pokemon = client.pokemon`

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

```ts
const pokemon = await client.pokemon.load({ id: 'pokemon_id' })
```

#### Example: List

```ts
const pokemons = await client.pokemon.list()
```


### PokemonSpecies

Create an instance: `const pokemon_species = client.pokemon_species`

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

```ts
const pokemon_species = await client.pokemon_species.load({ id: 'pokemon_species_id' })
```


### Type

Create an instance: `const type = client.type`

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

```ts
const type = await client.type.load({ id: 'type_id' })
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
error is returned to the caller as the second element in the return tuple.

### Features and hooks

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── pokapi_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`pokapi_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```python
ability = client.ability
ability.load({"id": "example_id"})

# ability.data_get() now returns the loaded ability data
# ability.match_get() returns the last match criteria
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
