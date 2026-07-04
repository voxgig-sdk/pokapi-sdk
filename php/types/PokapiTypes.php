<?php
declare(strict_types=1);

// Typed models for the Pokapi SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Ability entity data model. */
class Ability
{
    public ?array $effect_entry = null;
    public ?array $generation = null;
    public ?int $id = null;
    public ?bool $is_main_series = null;
    public ?string $name = null;
    public ?array $pokemon = null;
}

/** Request payload for Ability#load. */
class AbilityLoadMatch
{
    public string $id;
}

/** PaginatedResourceList entity data model. */
class PaginatedResourceList
{
}

/** Pokemon entity data model. */
class Pokemon
{
    public ?array $ability = null;
    public ?int $base_experience = null;
    public ?array $form = null;
    public ?array $game_index = null;
    public ?int $height = null;
    public ?array $held_item = null;
    public ?int $id = null;
    public ?bool $is_default = null;
    public ?array $location_area = null;
    public ?string $location_area_encounter = null;
    public ?array $mof = null;
    public ?string $name = null;
    public ?int $order = null;
    public ?array $species = null;
    public ?array $sprite = null;
    public ?array $stat = null;
    public ?array $type = null;
    public ?string $url = null;
    public ?array $version_detail = null;
    public ?int $weight = null;
}

/** Request payload for Pokemon#load. */
class PokemonLoadMatch
{
    public string $id;
}

/** Request payload for Pokemon#list. */
class PokemonListMatch
{
    public int $id;
}

/** PokemonSpecies entity data model. */
class PokemonSpecies
{
    public ?int $base_happiness = null;
    public ?int $capture_rate = null;
    public ?bool $forms_switchable = null;
    public ?int $gender_rate = null;
    public ?bool $has_gender_difference = null;
    public ?int $hatch_counter = null;
    public ?int $id = null;
    public ?bool $is_baby = null;
    public ?bool $is_legendary = null;
    public ?bool $is_mythical = null;
    public ?string $name = null;
    public ?int $order = null;
}

/** Request payload for PokemonSpecies#load. */
class PokemonSpeciesLoadMatch
{
    public string $id;
}

/** Type entity data model. */
class Type
{
    public ?array $damage_relation = null;
    public ?array $game_index = null;
    public ?array $generation = null;
    public ?int $id = null;
    public ?array $move_damage_class = null;
    public ?string $name = null;
    public ?array $pokemon = null;
}

/** Request payload for Type#load. */
class TypeLoadMatch
{
    public string $id;
}

