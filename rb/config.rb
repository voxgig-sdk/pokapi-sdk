# Pokapi SDK configuration

module PokapiConfig
  def self.make_config
    {
      "main" => {
        "name" => "Pokapi",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://pokeapi.co/api/v2",
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "ability" => {},
          "paginated_resource_list" => {},
          "pokemon" => {},
          "pokemon_species" => {},
          "type" => {},
        },
      },
      "entity" => {
        "ability" => {
          "fields" => [
            {
              "name" => "effect_entry",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "generation",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "id",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "is_main_series",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "pokemon",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 5,
            },
          ],
          "name" => "ability",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id_or_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/ability/{idOrName}",
                  "parts" => [
                    "ability",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "idOrName" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "paginated_resource_list" => {
          "fields" => [],
          "name" => "paginated_resource_list",
          "op" => {},
          "relations" => {
            "ancestors" => [],
          },
        },
        "pokemon" => {
          "fields" => [
            {
              "name" => "ability",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "base_experience",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "form",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "game_index",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "height",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "held_item",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "id",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "is_default",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "location_area",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "location_area_encounter",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 9,
            },
            {
              "name" => "mof",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 10,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 11,
            },
            {
              "name" => "order",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 12,
            },
            {
              "name" => "species",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 13,
            },
            {
              "name" => "sprite",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 14,
            },
            {
              "name" => "stat",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 15,
            },
            {
              "name" => "type",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 16,
            },
            {
              "name" => "url",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 17,
            },
            {
              "name" => "version_detail",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 18,
            },
            {
              "name" => "weight",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 19,
            },
          ],
          "name" => "pokemon",
          "op" => {
            "list" => {
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => 100,
                        "kind" => "query",
                        "name" => "limit",
                        "orig" => "limit",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "offset",
                        "orig" => "offset",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/pokemon",
                  "parts" => [
                    "pokemon",
                  ],
                  "select" => {
                    "exist" => [
                      "limit",
                      "offset",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
                {
                  "args" => {
                    "params" => [
                      {
                        "example" => 132,
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => true,
                        "type" => "`$INTEGER`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/pokemon/{id}/encounters",
                  "parts" => [
                    "pokemon",
                    "{id}",
                    "encounters",
                  ],
                  "select" => {
                    "$action" => "encounter",
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 1,
                },
              ],
              "input" => "data",
              "key$" => "list",
            },
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id_or_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/pokemon/{idOrName}",
                  "parts" => [
                    "pokemon",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "idOrName" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "pokemon_species" => {
          "fields" => [
            {
              "name" => "base_happiness",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "capture_rate",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "forms_switchable",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "gender_rate",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "has_gender_difference",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "hatch_counter",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "id",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 6,
            },
            {
              "name" => "is_baby",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 7,
            },
            {
              "name" => "is_legendary",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 8,
            },
            {
              "name" => "is_mythical",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "active" => true,
              "index$" => 9,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 10,
            },
            {
              "name" => "order",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 11,
            },
          ],
          "name" => "pokemon_species",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id_or_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/pokemon-species/{idOrName}",
                  "parts" => [
                    "pokemon-species",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "idOrName" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "type" => {
          "fields" => [
            {
              "name" => "damage_relation",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 0,
            },
            {
              "name" => "game_index",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 1,
            },
            {
              "name" => "generation",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 2,
            },
            {
              "name" => "id",
              "req" => false,
              "type" => "`$INTEGER`",
              "active" => true,
              "index$" => 3,
            },
            {
              "name" => "move_damage_class",
              "req" => false,
              "type" => "`$OBJECT`",
              "active" => true,
              "index$" => 4,
            },
            {
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "active" => true,
              "index$" => 5,
            },
            {
              "name" => "pokemon",
              "req" => false,
              "type" => "`$ARRAY`",
              "active" => true,
              "index$" => 6,
            },
          ],
          "name" => "type",
          "op" => {
            "load" => {
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "id_or_name",
                        "reqd" => true,
                        "type" => "`$STRING`",
                        "active" => true,
                      },
                    ],
                  },
                  "method" => "GET",
                  "orig" => "/type/{idOrName}",
                  "parts" => [
                    "type",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "idOrName" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "active" => true,
                  "index$" => 0,
                },
              ],
              "input" => "data",
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    PokapiFeatures.make_feature(name)
  end
end
