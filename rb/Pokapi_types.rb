# frozen_string_literal: true

# Typed models for the Pokapi SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Ability entity data model.
#
# @!attribute [rw] effect_entry
#   @return [Array, nil]
#
# @!attribute [rw] generation
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_main_series
#   @return [Boolean, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] pokemon
#   @return [Array, nil]
Ability = Struct.new(
  :effect_entry,
  :generation,
  :id,
  :is_main_series,
  :name,
  :pokemon,
  keyword_init: true
)

# Request payload for Ability#load.
#
# @!attribute [rw] id
#   @return [String]
AbilityLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# PaginatedResourceList entity data model.
class PaginatedResourceList
end

# Pokemon entity data model.
#
# @!attribute [rw] ability
#   @return [Array, nil]
#
# @!attribute [rw] base_experience
#   @return [Integer, nil]
#
# @!attribute [rw] form
#   @return [Array, nil]
#
# @!attribute [rw] game_index
#   @return [Array, nil]
#
# @!attribute [rw] height
#   @return [Integer, nil]
#
# @!attribute [rw] held_item
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_default
#   @return [Boolean, nil]
#
# @!attribute [rw] location_area
#   @return [Hash, nil]
#
# @!attribute [rw] location_area_encounter
#   @return [String, nil]
#
# @!attribute [rw] mof
#   @return [Array, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] order
#   @return [Integer, nil]
#
# @!attribute [rw] species
#   @return [Hash, nil]
#
# @!attribute [rw] sprite
#   @return [Hash, nil]
#
# @!attribute [rw] stat
#   @return [Array, nil]
#
# @!attribute [rw] type
#   @return [Array, nil]
#
# @!attribute [rw] url
#   @return [String, nil]
#
# @!attribute [rw] version_detail
#   @return [Array, nil]
#
# @!attribute [rw] weight
#   @return [Integer, nil]
Pokemon = Struct.new(
  :ability,
  :base_experience,
  :form,
  :game_index,
  :height,
  :held_item,
  :id,
  :is_default,
  :location_area,
  :location_area_encounter,
  :mof,
  :name,
  :order,
  :species,
  :sprite,
  :stat,
  :type,
  :url,
  :version_detail,
  :weight,
  keyword_init: true
)

# Request payload for Pokemon#load.
#
# @!attribute [rw] id
#   @return [String]
PokemonLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Pokemon#list.
#
# @!attribute [rw] id
#   @return [Integer]
PokemonListMatch = Struct.new(
  :id,
  keyword_init: true
)

# PokemonSpecies entity data model.
#
# @!attribute [rw] base_happiness
#   @return [Integer, nil]
#
# @!attribute [rw] capture_rate
#   @return [Integer, nil]
#
# @!attribute [rw] forms_switchable
#   @return [Boolean, nil]
#
# @!attribute [rw] gender_rate
#   @return [Integer, nil]
#
# @!attribute [rw] has_gender_difference
#   @return [Boolean, nil]
#
# @!attribute [rw] hatch_counter
#   @return [Integer, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] is_baby
#   @return [Boolean, nil]
#
# @!attribute [rw] is_legendary
#   @return [Boolean, nil]
#
# @!attribute [rw] is_mythical
#   @return [Boolean, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] order
#   @return [Integer, nil]
PokemonSpecies = Struct.new(
  :base_happiness,
  :capture_rate,
  :forms_switchable,
  :gender_rate,
  :has_gender_difference,
  :hatch_counter,
  :id,
  :is_baby,
  :is_legendary,
  :is_mythical,
  :name,
  :order,
  keyword_init: true
)

# Request payload for PokemonSpecies#load.
#
# @!attribute [rw] id
#   @return [String]
PokemonSpeciesLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

# Type entity data model.
#
# @!attribute [rw] damage_relation
#   @return [Hash, nil]
#
# @!attribute [rw] game_index
#   @return [Array, nil]
#
# @!attribute [rw] generation
#   @return [Hash, nil]
#
# @!attribute [rw] id
#   @return [Integer, nil]
#
# @!attribute [rw] move_damage_class
#   @return [Hash, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] pokemon
#   @return [Array, nil]
Type = Struct.new(
  :damage_relation,
  :game_index,
  :generation,
  :id,
  :move_damage_class,
  :name,
  :pokemon,
  keyword_init: true
)

# Request payload for Type#load.
#
# @!attribute [rw] id
#   @return [String]
TypeLoadMatch = Struct.new(
  :id,
  keyword_init: true
)

