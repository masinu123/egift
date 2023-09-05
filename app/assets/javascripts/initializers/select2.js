var App = (function () {

  App.select2 = function(wp){
    'use strict'

    function select2ReloadDataInit(wp){
      if($('.select2ReloadData', wp).length > 0) {
        $('.select2ReloadData', wp).on('change', function(){
          var url = $(this).data('reloadDataUrl');
          if(typeof(url) == 'undefined'){
            return
          }

          var $target = $($(this).data('reloadDataTarget'));
          if($target.length <= 0){
            return
          }

          url = url.replace('%{val}', $(this).val());
          url = url.replace('%25%7Bval%7D', $(this).val());
          // console.log(url);

          $.ajax({
            type: 'GET',
            url: url,
            success: function(resp){
              var placeholder = $target.attr("placeholder");
              $target.select2('destroy').empty().select2({data: resp.data, allowClear: true, placeholder: placeholder});
            }
          });
        });
      }
    }

    function select2Init(wp){
      var selects = $('.select2Normal');
      if(typeof(wp) != 'undefined') {
        var selects = $('.select2Normal', wp);
      }

      selects.each(function() {
        var placeholder = $(this).attr("placeholder");
        var tags = $(this).data("tags");
        var separators = $(this).data("separators");

        $(this).select2({
          width: '100%',
          allowClear: false,
          // placeholder: placeholder,
          tags: ( typeof tags !== 'undefined' ? tags : undefined ),
          tokenSeparators: (typeof separators !== 'undefined' ? separators : (typeof tags !== 'undefined' ? [' ', ','] : undefined))
        });
      });
    }

    function select2AjaxInit(wp) {
      var selects = $('.select2Ajax');
      if(typeof(wp) != 'undefined') {
        var selects = $('.select2Ajax', wp);
      }

      selects.each(function() {
        var perPage = $(this).data("perPage") || 10;

        // Init select list and load data from remote resource
        var tags = $(this).data("tags");
        var placeholder = $(this).attr("placeholder");
        var separators = $(this).data("separators");

        $(this).select2({
          tags: ( typeof tags !== 'undefined' ? tags : undefined ),
          tokenSeparators: (typeof separators !== 'undefined' ? separators : (typeof tags !== 'undefined' ? [' ', ','] : undefined)),
          placeholder: placeholder,
          allowClear: !!placeholder,
          ajax: {
            url: $(this).data("url"),
            dataType: "json",
            delay: 350,
            // Prepare data that gets submitted to remote resource
            data: function (params) {
              var result = $(this).data('select2Params');
              if(result && typeof(result) == 'object') {
                return Object.assign({}, result, { term: params.term, per_page: perPage, page: params.page });
              } else {
                return {
                  term: params.term,
                  per_page: perPage,
                  page: params.page
                };
              }
            },
            // Format return data from remote resource to match Select2 format
            processResults: function (resp, params) {
              params.page = params.page || 1;
              return {
                results: resp.data,
                pagination: {
                  more: resp.data.length == perPage
                }
              };
            }
          }
        });
      });
    }

    select2Init(wp);
    select2AjaxInit(wp);
    select2ReloadDataInit(wp);
  };
  return App;
})(App || {});
