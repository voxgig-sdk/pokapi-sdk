// Typed models for the Pokapi SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface Ability {
  effect_entry?: any[]
  generation?: Record<string, any>
  id?: number
  is_main_series?: boolean
  name?: string
  pokemon?: any[]
}

export interface AbilityLoadMatch {
  id: string
}

export interface PaginatedResourceList {
}

export interface Pokemon {
  ability?: any[]
  base_experience?: number
  form?: any[]
  game_index?: any[]
  height?: number
  held_item?: any[]
  id?: number
  is_default?: boolean
  location_area?: Record<string, any>
  location_area_encounter?: string
  mof?: any[]
  name?: string
  order?: number
  species?: Record<string, any>
  sprite?: Record<string, any>
  stat?: any[]
  type?: any[]
  url?: string
  version_detail?: any[]
  weight?: number
}

export interface PokemonLoadMatch {
  id: string
}

export interface PokemonListMatch {
  id: number
}

export interface PokemonSpecies {
  base_happiness?: number
  capture_rate?: number
  forms_switchable?: boolean
  gender_rate?: number
  has_gender_difference?: boolean
  hatch_counter?: number
  id?: number
  is_baby?: boolean
  is_legendary?: boolean
  is_mythical?: boolean
  name?: string
  order?: number
}

export interface PokemonSpeciesLoadMatch {
  id: string
}

export interface Type {
  damage_relation?: Record<string, any>
  game_index?: any[]
  generation?: Record<string, any>
  id?: number
  move_damage_class?: Record<string, any>
  name?: string
  pokemon?: any[]
}

export interface TypeLoadMatch {
  id: string
}

