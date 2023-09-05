var App = (function () {

  App.jsonEditor = function () {
    'use strict'

    function init() {
      if (0 < $('.json-editor').length) {
        $(".json-editor").each(function(){
          initJSONEeditor($(this).attr('id'));
        });
      }
    }

    function initJSONEeditor(elementId) {
      var jsonEl = document.getElementById(elementId);
      var inputEl = document.getElementById(jsonEl.getAttribute("data-target"));
      var val = inputEl.value;
      if (val == "") {
        val = '{ "field": "value" }';
      }
      var mod = jsonEl.getAttribute("data-mode");
      if (mod == "") {
        mod = "text";
      }
      new JSONEditor(jsonEl, {
        mode: mod,
        indentation: 2,
        onChangeText: function(text, e){
          try {
            inputEl.value = JSON.stringify(JSON.parse(text));
          }
          catch(err) {}
        },
        onChangeJSON: function(json, e){
          try {
            inputEl.value = JSON.stringify(json);
          }
          catch(err) {}
        }
      }).set(JSON.parse(val));
    }

    init();
  };
  return App;
})(App || {});
