// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as ReactDom from "react-dom";
import * as Multiselect$Arike from "../Multi-select-dropdown/Multiselect.bs.js";

function runReact(rootId, name, id, label, placeholder, dataElem) {
  var root = document.querySelector("#" + rootId);
  if (!(root == null)) {
    ReactDom.render(React.createElement(Multiselect$Arike.make, {
              name: name,
              id: id,
              label: label,
              placeholder: placeholder,
              dataElem: dataElem
            }), root);
    return ;
  }
  
}

window.runReact = runReact;

export {
  runReact ,
  
}
/*  Not a pure module */
