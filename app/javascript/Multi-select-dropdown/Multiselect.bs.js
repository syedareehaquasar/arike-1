// Generated by ReScript, PLEASE EDIT WITH CARE

import * as $$Array from "bs-platform/lib/es6/array.js";
import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Caml_obj from "bs-platform/lib/es6/caml_obj.js";
import * as Belt_Option from "bs-platform/lib/es6/belt_Option.js";
import * as Caml_option from "bs-platform/lib/es6/caml_option.js";
import * as MultiselectDropdown$Arike from "../shared/components/MultiselectDropdown.bs.js";

function str(prim) {
  return prim;
}

function label(_t) {
  
}

function id(t) {
  return t._0;
}

function value(t) {
  return t._1;
}

var searchString = value;

function color(_t) {
  return "gray";
}

function makeVolunteer(id, name) {
  return /* Volunteer */{
          _0: id,
          _1: name
        };
}

var Selectable = {
  label: label,
  id: id,
  value: value,
  searchString: searchString,
  color: color,
  makeVolunteer: makeVolunteer
};

var Multiselect = MultiselectDropdown$Arike.Make({
      label: label,
      value: value,
      searchString: searchString,
      color: color
    });

var unselected = [
  /* Volunteer */{
    _0: "1",
    _1: "Yash Raj Gupta"
  },
  /* Volunteer */{
    _0: "2",
    _1: "jjjj"
  },
  /* Volunteer */{
    _0: "3",
    _1: "kkkk"
  },
  /* Volunteer */{
    _0: "4",
    _1: "llll"
  },
  /* Volunteer */{
    _0: "5",
    _1: "Ypp"
  }
];

function deselect(selected, setState, selectable) {
  var newSelected = selected.filter(function (s) {
        return Caml_obj.caml_notequal(s, selectable);
      });
  return Curry._1(setState, (function (param) {
                return {
                        selected: newSelected,
                        searchString: ""
                      };
              }));
}

function Multiselect$MinimalExample(Props) {
  var match = React.useState(function () {
        return {
                selected: [],
                searchString: ""
              };
      });
  var setState = match[1];
  var state = match[0];
  var match$1 = React.useState(function () {
        return unselected;
      });
  var setUS = match$1[1];
  var us = match$1[0];
  React.useEffect((function () {
          var na = us.filter(function (tmp) {
                var got = state.selected.find(function (elem) {
                      return id(elem) === id(tmp);
                    });
                return !Belt_Option.isSome(got === undefined ? undefined : Caml_option.some(got));
              });
          console.log(na);
          Curry._1(setUS, (function (param) {
                  return na;
                }));
          
        }), [state]);
  var partial_arg = state.selected;
  return React.createElement("div", {
              className: "mt-4"
            }, React.createElement("div", {
                  className: "mt-4"
                }, React.createElement("label", {
                      className: "block text-sm font-medium text-gray-700",
                      htmlFor: "MultiselectDropdown__search-input"
                    }, "Asha Member ")), React.createElement(Multiselect.make, {
                  onChange: (function (searchString) {
                      return Curry._1(setState, (function (s) {
                                    return {
                                            selected: s.selected,
                                            searchString: searchString
                                          };
                                  }));
                    }),
                  value: state.searchString,
                  unselected: us,
                  selected: state.selected,
                  onSelect: (function (selectable) {
                      return Curry._1(setState, (function (s) {
                                    return {
                                            selected: $$Array.append(s.selected, [selectable]),
                                            searchString: ""
                                          };
                                  }));
                    }),
                  onDeselect: (function (param) {
                      return deselect(partial_arg, setState, param);
                    }),
                  hint: "Enter Name",
                  defaultOptions: us
                }));
}

var MinimalExample = {
  Selectable: Selectable,
  Multiselect: Multiselect,
  unselected: unselected,
  deselect: deselect,
  make: Multiselect$MinimalExample
};

export {
  str ,
  MinimalExample ,
  
}
/* Multiselect Not a pure module */
