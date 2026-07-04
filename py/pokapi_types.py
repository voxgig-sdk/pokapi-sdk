# Typed models for the Pokapi SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Ability:
    effect_entry: Optional[list] = None
    generation: Optional[dict] = None
    id: Optional[int] = None
    is_main_series: Optional[bool] = None
    name: Optional[str] = None
    pokemon: Optional[list] = None


@dataclass
class AbilityLoadMatch:
    id: str


@dataclass
class PaginatedResourceList:
    pass


@dataclass
class Pokemon:
    ability: Optional[list] = None
    base_experience: Optional[int] = None
    form: Optional[list] = None
    game_index: Optional[list] = None
    height: Optional[int] = None
    held_item: Optional[list] = None
    id: Optional[int] = None
    is_default: Optional[bool] = None
    location_area: Optional[dict] = None
    location_area_encounter: Optional[str] = None
    mof: Optional[list] = None
    name: Optional[str] = None
    order: Optional[int] = None
    species: Optional[dict] = None
    sprite: Optional[dict] = None
    stat: Optional[list] = None
    type: Optional[list] = None
    url: Optional[str] = None
    version_detail: Optional[list] = None
    weight: Optional[int] = None


@dataclass
class PokemonLoadMatch:
    id: str


@dataclass
class PokemonListMatch:
    id: int


@dataclass
class PokemonSpecies:
    base_happiness: Optional[int] = None
    capture_rate: Optional[int] = None
    forms_switchable: Optional[bool] = None
    gender_rate: Optional[int] = None
    has_gender_difference: Optional[bool] = None
    hatch_counter: Optional[int] = None
    id: Optional[int] = None
    is_baby: Optional[bool] = None
    is_legendary: Optional[bool] = None
    is_mythical: Optional[bool] = None
    name: Optional[str] = None
    order: Optional[int] = None


@dataclass
class PokemonSpeciesLoadMatch:
    id: str


@dataclass
class Type:
    damage_relation: Optional[dict] = None
    game_index: Optional[list] = None
    generation: Optional[dict] = None
    id: Optional[int] = None
    move_damage_class: Optional[dict] = None
    name: Optional[str] = None
    pokemon: Optional[list] = None


@dataclass
class TypeLoadMatch:
    id: str

