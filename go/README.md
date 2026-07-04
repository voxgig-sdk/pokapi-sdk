# Pokapi Golang SDK



The Golang SDK for the Pokapi API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/pokapi-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/pokapi-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/pokapi-sdk/go=../pokapi-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```go
package main

import (
    "fmt"

    sdk "github.com/voxgig-sdk/pokapi-sdk/go"
    "github.com/voxgig-sdk/pokapi-sdk/go/core"
)

func main() {
    client := sdk.New()
```

### 3. Load an ability

```go
    result, err = client.Ability(nil).Load(
        map[string]any{"id": "example_id"}, nil,
    )
    if err != nil {
        panic(err)
    }

    rm = core.ToMapAny(result)
    if rm["ok"] == true {
        fmt.Println(rm["data"])
    }
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

result, err := client.Ability(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
// result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewPokapiSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewPokapiSDK

```go
func NewPokapiSDK(options map[string]any) *PokapiSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *PokapiSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### PokapiSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Ability` | `(data map[string]any) PokapiEntity` | Create a Ability entity instance. |
| `PaginatedResourceList` | `(data map[string]any) PokapiEntity` | Create a PaginatedResourceList entity instance. |
| `Pokemon` | `(data map[string]any) PokapiEntity` | Create a Pokemon entity instance. |
| `PokemonSpecies` | `(data map[string]any) PokapiEntity` | Create a PokemonSpecies entity instance. |
| `Type` | `(data map[string]any) PokapiEntity` | Create a Type entity instance. |

### Entity interface (PokapiEntity)

All entities implement the `PokapiEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(any, error)`. The `any` value is a
`map[string]any` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `"ok"` | `bool` | `true` if the HTTP status is 2xx. |
| `"status"` | `int` | HTTP status code. |
| `"headers"` | `map[string]any` | Response headers. |
| `"data"` | `any` | Parsed JSON response body. |

On error, `"ok"` is `false` and `"err"` contains the error value.

### Entities

#### Ability

| Field | Description |
| --- | --- |
| `"effect_entry"` |  |
| `"generation"` |  |
| `"id"` |  |
| `"is_main_series"` |  |
| `"name"` |  |
| `"pokemon"` |  |

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
| `"ability"` |  |
| `"base_experience"` |  |
| `"form"` |  |
| `"game_index"` |  |
| `"height"` |  |
| `"held_item"` |  |
| `"id"` |  |
| `"is_default"` |  |
| `"location_area"` |  |
| `"location_area_encounter"` |  |
| `"mof"` |  |
| `"name"` |  |
| `"order"` |  |
| `"species"` |  |
| `"sprite"` |  |
| `"stat"` |  |
| `"type"` |  |
| `"url"` |  |
| `"version_detail"` |  |
| `"weight"` |  |

Operations: List, Load.

API path: `/pokemon`

#### PokemonSpecies

| Field | Description |
| --- | --- |
| `"base_happiness"` |  |
| `"capture_rate"` |  |
| `"forms_switchable"` |  |
| `"gender_rate"` |  |
| `"has_gender_difference"` |  |
| `"hatch_counter"` |  |
| `"id"` |  |
| `"is_baby"` |  |
| `"is_legendary"` |  |
| `"is_mythical"` |  |
| `"name"` |  |
| `"order"` |  |

Operations: Load.

API path: `/pokemon-species/{idOrName}`

#### Type

| Field | Description |
| --- | --- |
| `"damage_relation"` |  |
| `"game_index"` |  |
| `"generation"` |  |
| `"id"` |  |
| `"move_damage_class"` |  |
| `"name"` |  |
| `"pokemon"` |  |

Operations: Load.

API path: `/type/{idOrName}`



## Entities


### Ability

Create an instance: `ability := client.Ability(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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

```go
result, err := client.Ability(nil).Load(map[string]any{"id": "ability_id"}, nil)
```


### PaginatedResourceList

Create an instance: `paginated_resource_list := client.PaginatedResourceList(nil)`


### Pokemon

Create an instance: `pokemon := client.Pokemon(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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

```go
result, err := client.Pokemon(nil).Load(map[string]any{"id": "pokemon_id"}, nil)
```

#### Example: List

```go
results, err := client.Pokemon(nil).List(nil, nil)
```


### PokemonSpecies

Create an instance: `pokemon_species := client.PokemonSpecies(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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

```go
result, err := client.PokemonSpecies(nil).Load(map[string]any{"id": "pokemon_species_id"}, nil)
```


### Type

Create an instance: `type := client.Type(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

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

```go
result, err := client.Type(nil).Load(map[string]any{"id": "type_id"}, nil)
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
error is returned to the caller. An unexpected panic triggers the
`PreUnexpected` hook.

### Features and hooks

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/pokapi-sdk/go/
├── pokapi.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/pokapi-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
ability := client.Ability(nil)
ability.Load(map[string]any{"id": "example_id"}, nil)

// ability.Data() now returns the loaded ability data
// ability.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
