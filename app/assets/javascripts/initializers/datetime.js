var App = (function () {

  App.datetimePicker = function(wp){
    'use strict'

    function datePickerInit(wp){
      var els = $('.date-picker');
      if(typeof(wp) != 'undefined') {
        var els = $('.date-picker', wp);
      }

      els.each(function(){
        $(this).datepickerBootstrap({
          startDate: typeof($(this).data('startDate')) != 'undefined' ? $(this).data('startDate') + '' : null,
          format: 'yyyy-mm-dd',
          todayHighlight: true
        });
      });
    }

    function datetimePickerInit(){
      $('.datetime-picker').datetimepicker({
        format: 'Y-m-d H:i:s O',
        step: 1,
        onGenerate: function(val, el){
          if(el.val() == ''){
            return;
          }
          var dateVal = new Date(el.val());
          el.val(moment(dateVal).format('YYYY-MM-DD HH:mm:59 Z'));
        }
      });
    }

    datePickerInit();
    datetimePickerInit(wp);
  };
  return App;
})(App || {});
