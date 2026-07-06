# Pokapi PHP SDK Reference

Complete API reference for the Pokapi PHP SDK.


## PokapiSDK

### Constructor

```php
require_once __DIR__ . '/pokapi_sdk.php';

$client = new PokapiSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `PokapiSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = PokapiSDK::test();
```


### Instance Methods

#### `Ability($data = null)`

Create a new `AbilityEntity` instance. Pass `null` for no initial data.

#### `PaginatedResourceList($data = null)`

Create a new `PaginatedResourceListEntity` instance. Pass `null` for no initial data.

#### `Pokemon($data = null)`

Create a new `PokemonEntity` instance. Pass `null` for no initial data.

#### `PokemonSpecies($data = null)`

Create a new `PokemonSpeciesEntity` instance. Pass `null` for no initial data.

#### `Type($data = null)`

Create a new `TypeEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): PokapiUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## AbilityEntity

```php
$ability = $client->Ability();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `effect_entry` | `array` | No |  |
| `generation` | `array` | No |  |
| `id` | `int` | No |  |
| `is_main_series` | `bool` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Ability()->load(["id" => "ability_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): AbilityEntity`

Create a new `AbilityEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PaginatedResourceListEntity

```php
$paginated_resource_list = $client->PaginatedResourceList();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PaginatedResourceListEntity`

Create a new `PaginatedResourceListEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PokemonEntity

```php
$pokemon = $client->Pokemon();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `ability` | `array` | No |  |
| `base_experience` | `int` | No |  |
| `form` | `array` | No |  |
| `game_index` | `array` | No |  |
| `height` | `int` | No |  |
| `held_item` | `array` | No |  |
| `id` | `int` | No |  |
| `is_default` | `bool` | No |  |
| `location_area` | `array` | No |  |
| `location_area_encounter` | `string` | No |  |
| `mof` | `array` | No |  |
| `name` | `string` | No |  |
| `order` | `int` | No |  |
| `species` | `array` | No |  |
| `sprite` | `array` | No |  |
| `stat` | `array` | No |  |
| `type` | `array` | No |  |
| `url` | `string` | No |  |
| `version_detail` | `array` | No |  |
| `weight` | `int` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Pokemon()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Pokemon()->load(["id" => "pokemon_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PokemonEntity`

Create a new `PokemonEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PokemonSpeciesEntity

```php
$pokemon_species = $client->PokemonSpecies();
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
| `name` | `string` | No |  |
| `order` | `int` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->PokemonSpecies()->load(["id" => "pokemon_species_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PokemonSpeciesEntity`

Create a new `PokemonSpeciesEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## TypeEntity

```php
$type = $client->Type();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `damage_relation` | `array` | No |  |
| `game_index` | `array` | No |  |
| `generation` | `array` | No |  |
| `id` | `int` | No |  |
| `move_damage_class` | `array` | No |  |
| `name` | `string` | No |  |
| `pokemon` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Type()->load(["id" => "type_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): TypeEntity`

Create a new `TypeEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new PokapiSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

