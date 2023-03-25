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

register C:\Users\OreoD\.cargo\bin\nu_plugin_query.exe  {
  "sig": {
    "name": "query",
    "usage": "Show all the query commands",
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
      }
    ],
    "input_type": "Any",
    "output_type": "Any",
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register C:\Users\OreoD\.cargo\bin\nu_plugin_query.exe  {
  "sig": {
    "name": "query json",
    "usage": "execute json query on json file (open --raw <file> | query json 'query string')",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "json query",
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
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
  },
  "examples": []
}

register C:\Users\OreoD\.cargo\bin\nu_plugin_query.exe  {
  "sig": {
    "name": "query web",
    "usage": "execute selector query on html/web",
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
        "long": "query",
        "short": "q",
        "arg": "String",
        "required": false,
        "desc": "selector query",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-html",
        "short": "m",
        "arg": null,
        "required": false,
        "desc": "return the query output as html",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "attribute",
        "short": "a",
        "arg": "String",
        "required": false,
        "desc": "downselect based on the given attribute",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "as-table",
        "short": "t",
        "arg": "Table",
        "required": false,
        "desc": "find table based on column header list",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "inspect",
        "short": "i",
        "arg": null,
        "required": false,
        "desc": "run in inspect mode to provide more information for determining column headers",
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
    "category": "Network"
  },
  "examples": []
}

register C:\Users\OreoD\.cargo\bin\nu_plugin_query.exe  {
  "sig": {
    "name": "query xml",
    "usage": "execute xpath query on xml",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "query",
        "desc": "xpath query",
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
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Filters"
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

