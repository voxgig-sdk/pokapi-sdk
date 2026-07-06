# Pokapi TypeScript SDK Reference

Complete API reference for the Pokapi TypeScript SDK.


## PokapiSDK

### Constructor

```ts
new PokapiSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PokapiSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = PokapiSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `PokapiSDK` instance in test mode.


### Instance Methods

#### `Ability(data?: object)`

Create a new `Ability` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `AbilityEntity` instance.

#### `PaginatedResourceList(data?: object)`

Create a new `PaginatedResourceList` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PaginatedResourceListEntity` instance.

#### `Pokemon(data?: object)`

Create a new `Pokemon` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PokemonEntity` instance.

#### `PokemonSpecies(data?: object)`

Create a new `PokemonSpecies` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PokemonSpeciesEntity` instance.

#### `Type(data?: object)`

Create a new `Type` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `TypeEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `PokapiSDK.test()`.

**Returns:** `PokapiSDK` instance in test mode.


---

## AbilityEntity

```ts
const ability = client.Ability()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `effect_entry` | `any[]` | No |  |
| `generation` | `Record<string, any>` | No |  |
| `id` | `number` | No |  |
| `is_main_series` | `boolean` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `any[]` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Ability().load({ id: 'ability_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `AbilityEntity` instance with the same client and
options.

#### `client()`

Return the parent `PokapiSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PaginatedResourceListEntity

```ts
const paginated_resource_list = client.PaginatedResourceList()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PaginatedResourceListEntity` instance with the same client and
options.

#### `client()`

Return the parent `PokapiSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PokemonEntity

```ts
const pokemon = client.Pokemon()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ability` | `any[]` | No |  |
| `base_experience` | `number` | No |  |
| `form` | `any[]` | No |  |
| `game_index` | `any[]` | No |  |
| `height` | `number` | No |  |
| `held_item` | `any[]` | No |  |
| `id` | `number` | No |  |
| `is_default` | `boolean` | No |  |
| `location_area` | `Record<string, any>` | No |  |
| `location_area_encounter` | `string` | No |  |
| `mof` | `any[]` | No |  |
| `name` | `string` | No |  |
| `order` | `number` | No |  |
| `species` | `Record<string, any>` | No |  |
| `sprite` | `Record<string, any>` | No |  |
| `stat` | `any[]` | No |  |
| `type` | `any[]` | No |  |
| `url` | `string` | No |  |
| `version_detail` | `any[]` | No |  |
| `weight` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Pokemon().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Pokemon().load({ id: 'pokemon_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PokemonEntity` instance with the same client and
options.

#### `client()`

Return the parent `PokapiSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PokemonSpeciesEntity

```ts
const pokemon_species = client.PokemonSpecies()
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

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.PokemonSpecies().load({ id: 'pokemon_species_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PokemonSpeciesEntity` instance with the same client and
options.

#### `client()`

Return the parent `PokapiSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## TypeEntity

```ts
const type = client.Type()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `damage_relation` | `Record<string, any>` | No |  |
| `game_index` | `any[]` | No |  |
| `generation` | `Record<string, any>` | No |  |
| `id` | `number` | No |  |
| `move_damage_class` | `Record<string, any>` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `any[]` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Type().load({ id: 'type_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `TypeEntity` instance with the same client and
options.

#### `client()`

Return the parent `PokapiSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new PokapiSDK({
  feature: {
    test: { active: true },
  }
})
```

