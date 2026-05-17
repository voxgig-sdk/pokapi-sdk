package voxgigpokapisdk

import (
	"github.com/voxgig-sdk/pokapi-sdk/go/core"
	"github.com/voxgig-sdk/pokapi-sdk/go/entity"
	"github.com/voxgig-sdk/pokapi-sdk/go/feature"
	_ "github.com/voxgig-sdk/pokapi-sdk/go/utility"
)

// Type aliases preserve external API.
type PokapiSDK = core.PokapiSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type PokapiEntity = core.PokapiEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type PokapiError = core.PokapiError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewAbilityEntityFunc = func(client *core.PokapiSDK, entopts map[string]any) core.PokapiEntity {
		return entity.NewAbilityEntity(client, entopts)
	}
	core.NewPaginatedResourceListEntityFunc = func(client *core.PokapiSDK, entopts map[string]any) core.PokapiEntity {
		return entity.NewPaginatedResourceListEntity(client, entopts)
	}
	core.NewPokemonEntityFunc = func(client *core.PokapiSDK, entopts map[string]any) core.PokapiEntity {
		return entity.NewPokemonEntity(client, entopts)
	}
	core.NewPokemonSpeciesEntityFunc = func(client *core.PokapiSDK, entopts map[string]any) core.PokapiEntity {
		return entity.NewPokemonSpeciesEntity(client, entopts)
	}
	core.NewTypeEntityFunc = func(client *core.PokapiSDK, entopts map[string]any) core.PokapiEntity {
		return entity.NewTypeEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewPokapiSDK = core.NewPokapiSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
