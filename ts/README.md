# Pokapi TypeScript SDK



The TypeScript SDK for the Pokapi API — a type-safe, entity-oriented client with full async/await support.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
npm install @voxgig-sdk/pokapi
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { PokapiSDK } from 'pokapi'

const client = new PokapiSDK({
  apikey: process.env.POKAPI_APIKEY,
})
```

### 3. Load a ability

```ts
const result = await client.Ability().load({ id: 'example_id' })

if (result.ok) {
  console.log(result.data)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = PokapiSDK.test()

const result = await client.Planet().load({ id: 'test01' })
// result.ok === true
// result.data contains mock response data
```

You can also use the instance method:

```ts
const client = new PokapiSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Planet()

// First call sets internal match
await entity.load({ id: 'example' })

// Subsequent calls reuse the stored match
const data = entity.data()
console.log(data.id) // 'example'
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new PokapiSDK({
  apikey: '...',
  extend: [logger],
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
POKAPI_TEST_LIVE=TRUE
POKAPI_APIKEY=<your-key>
```

Then run:

```bash
cd ts && npm test
```


## Reference

### PokapiSDK

#### Constructor

```ts
new PokapiSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Ability(data?)` | `AbilityEntity` | Create a Ability entity instance. |
| `PaginatedResourceList(data?)` | `PaginatedResourceListEntity` | Create a PaginatedResourceList entity instance. |
| `Pokemon(data?)` | `PokemonEntity` | Create a Pokemon entity instance. |
| `PokemonSpecies(data?)` | `PokemonSpeciesEntity` | Create a PokemonSpecies entity instance. |
| `Type(data?)` | `TypeEntity` | Create a Type entity instance. |
| `tester(testopts?, sdkopts?)` | `PokapiSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `PokapiSDK.test(testopts?, sdkopts?)` | `PokapiSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Result>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Result>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Result>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Result>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<Result>` | Remove an entity. |
| `data` | `data(data?): any` | Get or set entity data. |
| `match` | `match(match?): any` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): PokapiSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Result shape

All entity operations return a Result object:

```ts
{
  ok: boolean      // true if the HTTP status is 2xx
  status: number   // HTTP status code
  headers: object  // response headers
  data: any        // parsed JSON response body
}
```

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

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

Operations: load.

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

Operations: list, load.

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

Operations: load.

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

Operations: load.

API path: `/type/{idOrName}`



## Entities


### Ability

Create an instance: `const ability = client.Ability()`

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
const ability = await client.Ability().load({ id: 'ability_id' })
```


### PaginatedResourceList

Create an instance: `const paginated_resource_list = client.PaginatedResourceList()`


### Pokemon

Create an instance: `const pokemon = client.Pokemon()`

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
const pokemon = await client.Pokemon().load({ id: 'pokemon_id' })
```

#### Example: List

```ts
const pokemons = await client.Pokemon().list()
```


### PokemonSpecies

Create an instance: `const pokemon_species = client.PokemonSpecies()`

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
const pokemon_species = await client.PokemonSpecies().load({ id: 'pokemon_species_id' })
```


### Type

Create an instance: `const type = client.Type()`

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
const type = await client.Type().load({ id: 'type_id' })
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
error is returned to the caller.

An unexpected exception triggers the `PreUnexpected` hook before
propagating.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
pokapi/
├── src/
│   ├── PokapiSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { PokapiSDK } from 'pokapi'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const moon = client.Moon()
await moon.load({ planet_id: 'earth', id: 'luna' })

// moon.data() now returns the loaded moon data
// moon.match() returns { planet_id: 'earth', id: 'luna' }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
