# Typed models for the Pokapi SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Ability(TypedDict, total=False):
    effect_entry: list
    generation: dict
    id: int
    is_main_series: bool
    name: str
    pokemon: list


class AbilityLoadMatch(TypedDict):
    id: str


class PaginatedResourceList(TypedDict):
    pass


class Pokemon(TypedDict, total=False):
    ability: list
    base_experience: int
    form: list
    game_index: list
    height: int
    held_item: list
    id: int
    is_default: bool
    location_area: dict
    location_area_encounter: str
    mof: list
    name: str
    order: int
    species: dict
    sprite: dict
    stat: list
    type: list
    url: str
    version_detail: list
    weight: int


class PokemonLoadMatch(TypedDict):
    id: str


class PokemonListMatch(TypedDict):
    id: int


class PokemonSpecies(TypedDict, total=False):
    base_happiness: int
    capture_rate: int
    forms_switchable: bool
    gender_rate: int
    has_gender_difference: bool
    hatch_counter: int
    id: int
    is_baby: bool
    is_legendary: bool
    is_mythical: bool
    name: str
    order: int


class PokemonSpeciesLoadMatch(TypedDict):
    id: str


class Type(TypedDict, total=False):
    damage_relation: dict
    game_index: list
    generation: dict
    id: int
    move_damage_class: dict
    name: str
    pokemon: list


class TypeLoadMatch(TypedDict):
    id: str
