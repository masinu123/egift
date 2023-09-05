var App = (function () {

  App.imagePreview = function( ){
    'use strict'

    function init(){
      $('.featured-img').change(function(){
        readURL(this, $(this));
      });
    }

    /*
     * Read image url after browsing
     */
    function readURL(input, obj) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        var preview_img = obj.siblings('.preview-img');

        reader.onload = function (e) {
          preview_img.attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }

    init();
  };

  return App;
})(App || {});
