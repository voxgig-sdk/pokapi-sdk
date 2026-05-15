package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewAbilityEntityFunc func(client *PokapiSDK, entopts map[string]any) PokapiEntity

var NewPaginatedResourceListEntityFunc func(client *PokapiSDK, entopts map[string]any) PokapiEntity

var NewPokemonEntityFunc func(client *PokapiSDK, entopts map[string]any) PokapiEntity

var NewPokemonSpeciesEntityFunc func(client *PokapiSDK, entopts map[string]any) PokapiEntity

var NewTypeEntityFunc func(client *PokapiSDK, entopts map[string]any) PokapiEntity

