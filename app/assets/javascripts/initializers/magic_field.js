/*
 * Display relative fields based on drop list selection
 */
var ToggleFieldBySelection = {

  /**
   * @settings{
   *   selection: <accepts css selector (html element, id, class)>
   *   wrapper: <accepts css selector (html element, id, class)>
   *   field: <accepts css selector (html element, id, class)>
   * }
   */

  init: function(settings) {
    this.settings = settings
    this.bindUIAction(this.settings);
  },

  bindUIAction: function(settings) {
    if (settings) {

      var $target_element = settings.selection;

      if ($target_element.is("input[type='radio']")) {
        $target_element.each(function() {
          $(this).on('click', function() {
            var $parent = $( $(this).closest(settings.wrapper) );
            var $selected = $(this).val();

            Helper.hideElement( $parent.find(settings.field) );
            Helper.disableChildElement( $parent.find(settings.field), true );

            if ($selected) {
              var $element = $parent.find('[data-segment=' + $selected + ']');
              if ($(this).data('mfinsensitive')) {
                var $element = $parent.find('[data-segment*=' + $selected + ']');
              }
              Helper.showElement($element);
              Helper.disableChildElement( $element, false );
            }

          });

          if ($(this).is(':checked')) {
            $(this).on('click', function() {
              var $parent = $( $(this).closest(settings.wrapper) );
              var $selected = $(this).val();

              Helper.hideElement( $parent.find(settings.field) );
              Helper.disableChildElement( $parent.find(settings.field), true );

              if ($selected) {
                var $element = $parent.find('[data-segment=' + $selected + ']');
                if ($(this).data('mfinsensitive')) {
                  var $element = $parent.find('[data-segment*=' + $selected + ']');
                }
                Helper.showElement($element);
                Helper.disableChildElement( $element, false );
              }

            }).trigger('click');
          }
        });

      } else {
        $target_element.on('change', function() {
          var $parent = $( $(this).closest(settings.wrapper));
          var $selected = $(this).val();

          Helper.hideElement( $parent.find(settings.field) );
          Helper.disableChildElement( $parent.find(settings.field), true );

          if ($selected) {
            var $element = $parent.find('[data-segment=' + $selected + ']');
            if ($(this).data('mfinsensitive')) {
              var $element = $parent.find('[data-segment*=' + $selected + ']');
            }
            Helper.showElement($element);
            Helper.disableChildElement( $element, false );
          }

        }).trigger('change');
      }
    }
  }
};

/**
 * Check all relative checkboxes if a master checkbox is selected
 */
var CheckboxJS = {

  init: function() {
    this.checkAll();
  },

  checkAll: function() {
    $('input[type="checkbox"]').on('change', function() {
      var $this = $(this);
      var target = $this.data('target');
      var value= $this.data('value');
      var is_checked = $this.is(':checked');

      if(target) {
        $('input[type="checkbox"][data-value="'+ target +'"').each(function() {
          $(this).prop('checked', is_checked);
        })
      } else {
        $('input[type="checkbox"][data-target="'+ value +'"').each(function() {
          $(this).prop('checked', false);
        })
      }
    });
  }
};


/**
 * Helper
 */
var Helper = {
  hideElement: function(element) {
    element.hide();
  },

  showElement: function(element) {
    element.show();
  },

  disableChildElement: function(element, status) {
    element.find('input, select, textarea').prop('disabled', status);
  }
};

// var product_type_settings = {
//   selection: '.product-type-selector',
//   wrapper: '.product-type-wrapper',
//   field: '.segment'
// };

// progress
$(document).ready(function() {
  'use strict';

  $('.magicField').each(function(){
    ToggleFieldBySelection.init({
      selection:  $(this),
      wrapper:    $(this).data('mfwrapper'),
      field:      $(this).data('mfsegment')
    });
  });
  CheckboxJS.init();

});
