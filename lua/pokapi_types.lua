-- Typed models for the Pokapi SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
-- params (op.<name>.points[].args.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Ability
---@field effect_entry? table
---@field generation? table
---@field id? number
---@field is_main_series? boolean
---@field name? string
---@field pokemon? table

---@class AbilityLoadMatch
---@field id string

---@class PaginatedResourceList

---@class Pokemon
---@field ability? table
---@field base_experience? number
---@field form? table
---@field game_index? table
---@field height? number
---@field held_item? table
---@field id? number
---@field is_default? boolean
---@field location_area? table
---@field location_area_encounter? string
---@field mof? table
---@field name? string
---@field order? number
---@field species? table
---@field sprite? table
---@field stat? table
---@field type? table
---@field url? string
---@field version_detail? table
---@field weight? number

---@class PokemonLoadMatch
---@field id string

---@class PokemonListMatch
---@field ability? table
---@field base_experience? number
---@field form? table
---@field game_index? table
---@field height? number
---@field held_item? table
---@field id? number
---@field is_default? boolean
---@field location_area? table
---@field location_area_encounter? string
---@field mof? table
---@field name? string
---@field order? number
---@field species? table
---@field sprite? table
---@field stat? table
---@field type? table
---@field url? string
---@field version_detail? table
---@field weight? number

---@class PokemonSpecies
---@field base_happiness? number
---@field capture_rate? number
---@field forms_switchable? boolean
---@field gender_rate? number
---@field has_gender_difference? boolean
---@field hatch_counter? number
---@field id? number
---@field is_baby? boolean
---@field is_legendary? boolean
---@field is_mythical? boolean
---@field name? string
---@field order? number

---@class PokemonSpeciesLoadMatch
---@field id string

---@class Type
---@field damage_relation? table
---@field game_index? table
---@field generation? table
---@field id? number
---@field move_damage_class? table
---@field name? string
---@field pokemon? table

---@class TypeLoadMatch
---@field id string

local M = {}

return M
