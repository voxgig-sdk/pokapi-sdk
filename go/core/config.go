package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Pokapi",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://pokeapi.co/api/v2",
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"ability": map[string]any{},
				"paginated_resource_list": map[string]any{},
				"pokemon": map[string]any{},
				"pokemon_species": map[string]any{},
				"type": map[string]any{},
			},
		},
		"entity": map[string]any{
			"ability": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "effect_entry",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "generation",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "is_main_series",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "pokemon",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 5,
					},
				},
				"name": "ability",
				"op": map[string]any{
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id_or_name",
											"reqd": true,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/ability/{idOrName}",
								"parts": []any{
									"ability",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"idOrName": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"paginated_resource_list": map[string]any{
				"fields": []any{},
				"name": "paginated_resource_list",
				"op": map[string]any{},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"pokemon": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "ability",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "base_experience",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "form",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "game_index",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "height",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "held_item",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "is_default",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "location_area",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "location_area_encounter",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 9,
					},
					map[string]any{
						"name": "mof",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 10,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 11,
					},
					map[string]any{
						"name": "order",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 12,
					},
					map[string]any{
						"name": "species",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 13,
					},
					map[string]any{
						"name": "sprite",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 14,
					},
					map[string]any{
						"name": "stat",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 15,
					},
					map[string]any{
						"name": "type",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 16,
					},
					map[string]any{
						"name": "url",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 17,
					},
					map[string]any{
						"name": "version_detail",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 18,
					},
					map[string]any{
						"name": "weight",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 19,
					},
				},
				"name": "pokemon",
				"op": map[string]any{
					"list": map[string]any{
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 100,
											"kind": "query",
											"name": "limit",
											"orig": "limit",
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
										},
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "offset",
											"orig": "offset",
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/pokemon",
								"parts": []any{
									"pokemon",
								},
								"select": map[string]any{
									"exist": []any{
										"limit",
										"offset",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"example": 132,
											"kind": "param",
											"name": "id",
											"orig": "id",
											"reqd": true,
											"type": "`$INTEGER`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/pokemon/{id}/encounters",
								"parts": []any{
									"pokemon",
									"{id}",
									"encounters",
								},
								"select": map[string]any{
									"$action": "encounter",
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 1,
							},
						},
						"input": "data",
						"key$": "list",
					},
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id_or_name",
											"reqd": true,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/pokemon/{idOrName}",
								"parts": []any{
									"pokemon",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"idOrName": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"pokemon_species": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "base_happiness",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "capture_rate",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "forms_switchable",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "gender_rate",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "has_gender_difference",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "hatch_counter",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "is_baby",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "is_legendary",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "is_mythical",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 9,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 10,
					},
					map[string]any{
						"name": "order",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 11,
					},
				},
				"name": "pokemon_species",
				"op": map[string]any{
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id_or_name",
											"reqd": true,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/pokemon-species/{idOrName}",
								"parts": []any{
									"pokemon-species",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"idOrName": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"type": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "damage_relation",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "game_index",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "generation",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "move_damage_class",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "pokemon",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 6,
					},
				},
				"name": "type",
				"op": map[string]any{
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "id_or_name",
											"reqd": true,
											"type": "`$STRING`",
											"active": true,
										},
									},
								},
								"method": "GET",
								"orig": "/type/{idOrName}",
								"parts": []any{
									"type",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"idOrName": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
