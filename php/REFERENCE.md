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

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

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
| `effect_entry` | ``$ARRAY`` | No |  |
| `generation` | ``$OBJECT`` | No |  |
| `id` | ``$INTEGER`` | No |  |
| `is_main_series` | ``$BOOLEAN`` | No |  |
| `name` | ``$STRING`` | No |  |
| `pokemon` | ``$ARRAY`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Ability()->load(["id" => "ability_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): AbilityEntity`

Create a new `AbilityEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PaginatedResourceListEntity

```php
$paginated_resource_list = $client->PaginatedResourceList();
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PaginatedResourceListEntity`

Create a new `PaginatedResourceListEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PokemonEntity

```php
$pokemon = $client->Pokemon();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Pokemon()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Pokemon()->load(["id" => "pokemon_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PokemonEntity`

Create a new `PokemonEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PokemonSpeciesEntity

```php
$pokemon_species = $client->PokemonSpecies();
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

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->PokemonSpecies()->load(["id" => "pokemon_species_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PokemonSpeciesEntity`

Create a new `PokemonSpeciesEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## TypeEntity

```php
$type = $client->Type();
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

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Type()->load(["id" => "type_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): TypeEntity`

Create a new `TypeEntity` instance with the same client and
options.

#### `getName(): string`

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

