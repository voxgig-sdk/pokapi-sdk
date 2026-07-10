// Typed models for the Pokapi SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// Ability is the typed data model for the ability entity.
type Ability struct {
	EffectEntry *[]any `json:"effect_entry,omitempty"`
	Generation *map[string]any `json:"generation,omitempty"`
	Id *int `json:"id,omitempty"`
	IsMainSeries *bool `json:"is_main_series,omitempty"`
	Name *string `json:"name,omitempty"`
	Pokemon *[]any `json:"pokemon,omitempty"`
}

// AbilityLoadMatch is the typed request payload for Ability.LoadTyped.
type AbilityLoadMatch struct {
	Id string `json:"id"`
}

// PaginatedResourceList is the typed data model for the paginated_resource_list entity.
type PaginatedResourceList struct {
}

// Pokemon is the typed data model for the pokemon entity.
type Pokemon struct {
	Ability *[]any `json:"ability,omitempty"`
	BaseExperience *int `json:"base_experience,omitempty"`
	Form *[]any `json:"form,omitempty"`
	GameIndex *[]any `json:"game_index,omitempty"`
	Height *int `json:"height,omitempty"`
	HeldItem *[]any `json:"held_item,omitempty"`
	Id *int `json:"id,omitempty"`
	IsDefault *bool `json:"is_default,omitempty"`
	LocationArea *map[string]any `json:"location_area,omitempty"`
	LocationAreaEncounter *string `json:"location_area_encounter,omitempty"`
	Mof *[]any `json:"mof,omitempty"`
	Name *string `json:"name,omitempty"`
	Order *int `json:"order,omitempty"`
	Species *map[string]any `json:"species,omitempty"`
	Sprite *map[string]any `json:"sprite,omitempty"`
	Stat *[]any `json:"stat,omitempty"`
	Type *[]any `json:"type,omitempty"`
	Url *string `json:"url,omitempty"`
	VersionDetail *[]any `json:"version_detail,omitempty"`
	Weight *int `json:"weight,omitempty"`
}

// PokemonLoadMatch is the typed request payload for Pokemon.LoadTyped.
type PokemonLoadMatch struct {
	Id string `json:"id"`
}

// PokemonListMatch is the typed request payload for Pokemon.ListTyped.
type PokemonListMatch struct {
	Ability *[]any `json:"ability,omitempty"`
	BaseExperience *int `json:"base_experience,omitempty"`
	Form *[]any `json:"form,omitempty"`
	GameIndex *[]any `json:"game_index,omitempty"`
	Height *int `json:"height,omitempty"`
	HeldItem *[]any `json:"held_item,omitempty"`
	Id *int `json:"id,omitempty"`
	IsDefault *bool `json:"is_default,omitempty"`
	LocationArea *map[string]any `json:"location_area,omitempty"`
	LocationAreaEncounter *string `json:"location_area_encounter,omitempty"`
	Mof *[]any `json:"mof,omitempty"`
	Name *string `json:"name,omitempty"`
	Order *int `json:"order,omitempty"`
	Species *map[string]any `json:"species,omitempty"`
	Sprite *map[string]any `json:"sprite,omitempty"`
	Stat *[]any `json:"stat,omitempty"`
	Type *[]any `json:"type,omitempty"`
	Url *string `json:"url,omitempty"`
	VersionDetail *[]any `json:"version_detail,omitempty"`
	Weight *int `json:"weight,omitempty"`
}

// PokemonSpecies is the typed data model for the pokemon_species entity.
type PokemonSpecies struct {
	BaseHappiness *int `json:"base_happiness,omitempty"`
	CaptureRate *int `json:"capture_rate,omitempty"`
	FormsSwitchable *bool `json:"forms_switchable,omitempty"`
	GenderRate *int `json:"gender_rate,omitempty"`
	HasGenderDifference *bool `json:"has_gender_difference,omitempty"`
	HatchCounter *int `json:"hatch_counter,omitempty"`
	Id *int `json:"id,omitempty"`
	IsBaby *bool `json:"is_baby,omitempty"`
	IsLegendary *bool `json:"is_legendary,omitempty"`
	IsMythical *bool `json:"is_mythical,omitempty"`
	Name *string `json:"name,omitempty"`
	Order *int `json:"order,omitempty"`
}

// PokemonSpeciesLoadMatch is the typed request payload for PokemonSpecies.LoadTyped.
type PokemonSpeciesLoadMatch struct {
	Id string `json:"id"`
}

// Type is the typed data model for the type entity.
type Type struct {
	DamageRelation *map[string]any `json:"damage_relation,omitempty"`
	GameIndex *[]any `json:"game_index,omitempty"`
	Generation *map[string]any `json:"generation,omitempty"`
	Id *int `json:"id,omitempty"`
	MoveDamageClass *map[string]any `json:"move_damage_class,omitempty"`
	Name *string `json:"name,omitempty"`
	Pokemon *[]any `json:"pokemon,omitempty"`
}

// TypeLoadMatch is the typed request payload for Type.LoadTyped.
type TypeLoadMatch struct {
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
