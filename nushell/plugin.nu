register C:\Users\OreoD\AppData\Roaming\nushell\plugins\nu_plugin_periodic_table\target\release\nu_plugin_periodic_table.exe  {
  "sig": {
    "name": "periodic-table",
    "usage": "List the elements of the periodic table",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "vectorizes_over_list": false,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "classic",
        "short": "c",
        "arg": null,
        "required": false,
        "desc": "Display the elements in classical form",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "full",
        "short": "f",
        "arg": null,
        "required": false,
        "desc": "Display the full names of the columns",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_type": "Any",
    "output_type": "Any",
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": []
}

register C:\Users\OreoD\AppData\Roaming\nushell\plugins\nu_plugin_regex\target\release\nu_plugin_regex.exe  {
  "sig": {
    "name": "regex",
    "usage": "Parse input with a regular expression",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "pattern",
        "desc": "the regular expression to use",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "vectorizes_over_list": false,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_type": "Any",
    "output_type": "Any",
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": true,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "\"hello world\" | regex '(?P<first>\\w+) (?P<second>\\w+)'",
      "description": "Parse a string with a regular expression",
      "result": {
        "List": {
          "vals": [
            {
              "Record": {
                "cols": [
                  "input",
                  "capture_name",
                  "match",
                  "begin",
                  "end"
                ],
                "vals": [
                  {
                    "String": {
                      "val": "hello world",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "capgrp0",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "hello world",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 0,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 11,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "input",
                  "capture_name",
                  "match",
                  "begin",
                  "end"
                ],
                "vals": [
                  {
                    "String": {
                      "val": "hello world",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "first",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "hello",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 0,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 5,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            },
            {
              "Record": {
                "cols": [
                  "input",
                  "capture_name",
                  "match",
                  "begin",
                  "end"
                ],
                "vals": [
                  {
                    "String": {
                      "val": "hello world",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "second",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "String": {
                      "val": "world",
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 6,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  },
                  {
                    "Int": {
                      "val": 11,
                      "span": {
                        "start": 0,
                        "end": 0
                      }
                    }
                  }
                ],
                "span": {
                  "start": 0,
                  "end": 0
                }
              }
            }
          ],
          "span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

