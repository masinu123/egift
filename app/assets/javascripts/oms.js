//
//= require jquery
//= require jquery_ujs
// require rails-ujs

//= require crm-template/condensed/assets/plugins/pace/pace.min
//= require crm-template/condensed/assets/plugins/modernizr.custom
//= require crm-template/condensed/assets/plugins/jquery-ui/jquery-ui.min
//= require crm-template/condensed/assets/plugins/tether/js/tether.min
//= require crm-template/condensed/assets/plugins/bootstrap/js/bootstrap.min
//= require crm-template/condensed/assets/plugins/jquery/jquery-easy
//= require crm-template/condensed/assets/plugins/jquery-unveil/jquery.unveil.min
//= require crm-template/condensed/assets/plugins/jquery-ios-list/jquery.ioslist.min
//= require crm-template/condensed/assets/plugins/jquery-actual/jquery.actual.min
//= require crm-template/condensed/assets/plugins/jquery-scrollbar/jquery.scrollbar.min
// require crm-template/condensed/assets/plugins/select2/js/select2.full.min
//= require crm-template/condensed/assets/plugins/classie/classie
//= require crm-template/condensed/assets/plugins/switchery/js/switchery.min
//= require crm-template/condensed/assets/plugins/nvd3/lib/d3.v3
//= require crm-template/condensed/assets/plugins/nvd3/nv.d3.min
//= require crm-template/condensed/assets/plugins/nvd3/src/utils
//= require crm-template/condensed/assets/plugins/nvd3/src/tooltip
//= require crm-template/condensed/assets/plugins/nvd3/src/interactiveLayer
//= require crm-template/condensed/assets/plugins/nvd3/src/models/axis
//= require crm-template/condensed/assets/plugins/nvd3/src/models/line
//= require crm-template/condensed/assets/plugins/nvd3/src/models/lineWithFocusChart
//= require crm-template/condensed/assets/plugins/mapplic/js/hammer
//= require crm-template/condensed/assets/plugins/mapplic/js/jquery.mousewheel
//= require crm-template/condensed/assets/plugins/mapplic/js/mapplic
//= require crm-template/condensed/assets/plugins/rickshaw/rickshaw.min
//= require crm-template/condensed/assets/plugins/jquery-metrojs/MetroJs.min
//= require crm-template/condensed/assets/plugins/jquery-sparkline/jquery.sparkline.min
//= require crm-template/condensed/assets/plugins/skycons/skycons
//= require crm-template/condensed/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker
//= require crm-template/condensed/assets/plugins/dropzone/dropzone.min
//= require crm-template/condensed/pages/js/pages
//= require crm-template/condensed/assets/plugins/jquery-datatable/media/js/jquery.dataTables.min
//= require crm-template/condensed/assets/plugins/jquery-datatable/extensions/AutoFill/js/dataTables.autoFill.min

// require crm-template/condensed/assets/js/dashboard
// require crm-template/condensed/assets/plugins/jquery-isotope/isotope.pkgd.min
// require crm-template/condensed/pages/js/pages.social.min

//= require crm-template/condensed/assets/js/scripts

//= require select2-full

//= require froala_editor/html2pdf.bundle.min
//= require froala_editor/js/froala_editor.pkgd.min
//= require froala_editor/js/plugins/fullscreen.min
//= require froala_editor/js/plugins/font_family.min
//= require froala_editor/js/plugins/font_size.min
//= require froala_editor/js/plugins/colors.min
//= require froala_editor/js/plugins/inline_class.min
//= require froala_editor/js/plugins/inline_style.min
//= require froala_editor/js/plugins/paragraph_style.min
//= require froala_editor/js/plugins/line_height.min
//= require froala_editor/js/plugins/paragraph_format.min
//= require froala_editor/js/plugins/align.min
//= require froala_editor/js/plugins/quote.min
//= require froala_editor/js/plugins/link.min
//= require froala_editor/js/plugins/image.min
//= require froala_editor/js/plugins/video.min
//= require froala_editor/js/third_party/embedly.min
//= require froala_editor/js/plugins/table.min
//= require froala_editor/js/third_party/font_awesome.min
//= require froala_editor/js/plugins/special_characters.min
//= require froala_editor/js/plugins/print.min
//= require froala_editor/js/plugins/help.min
//= require froala_editor/js/plugins/quick_insert.min
//= require froala_editor/js/plugins/code_view.min
//= require froala_editor/js/plugins/lists.min

//= require datetimepicker/jquery.datetimepicker.full
//= require jquery.inputmask.bundle
//= require lightbox/lightbox.min
//= require moment
//= require tinymce/jquery.tinymce.min
//= require jsoneditor/jsoneditor.min

//= require initializers/common
//= require initializers/app
//= require initializers/select2
//= require initializers/datetime
//= require initializers/magic_field
//= require initializers/tinymce
//= require initializers/image_preview
//= require initializers/advanced_upload
//= require initializers/inputmask
//= require initializers/json_editor
//= require initializers/dropzone

//= require jquery_nested_form
//= require nested_form_fields

$(function() {
  //initialize the javascript
  App.select2();
  App.datetimePicker();
  App.advancedUpload();
  App.tinymce();
  App.imagePreview();
  App.inputmask();
  App.jsonEditor();

  $('[data-toggle="popover"]').popover();
  App.dropzone();

  if ($('[data-toggle="popover"]').length > 0) {
    $('[data-toggle="popover"]').each(function() {
      $(this).popover({
        trigger: $(this).data("trigger") || "hover",
        placement: $(this).data("placement"),
        html: true,
        content: 'string'
      });
    });
  }
  
  function formatJson() {
    $(".json").each(function(){
      element = $(this);
      var obj = JSON.parse(element.text());
      element.html(JSON.stringify(obj, undefined, 2));
    });
  }
  formatJson();

  if (0 < $('.btn-import').length) {
    $('.btn-import').click(function(e){
      e.preventDefault();
      $($(this).data('target')).click();
      return false;
    });
    
    $($('.btn-import').data('target')).change(function(){
      $('.btn-import').button('loading'); 
      $(this).closest('form').submit();
    });
  }

  if (0 < $('.btn-loading').length) {
    $('.btn-loading').click(function(){
      $(this).attr("disabled", true);
      $(this).html($(this).data('loadingText'));
    });
  }

  if (0 < $('.btn-copy').length) {
    $('.btn-copy').click(function(e) {
      e.preventDefault();
      var $this = $(this);
      if($this.html() == 'Copied') {
        return;
      }

      var txt = $('.btn-copy').html();
      var content = $($this.data('target'), $this.parent()).text();
      $this.html('Copied').fadeIn();
      var $temp = $("<input>");
      $("body").append($temp);
      $temp.val(content).select();
      document.execCommand("copy");
      $temp.remove();
      setTimeout(function(){
        $this.fadeIn('slow').html(txt);
      }, 1000);
      return false;
    });
  }

  // $('[data-toggle="popover"]').popover();

  $(document).on('nested:fieldAdded', function(event) {
    var field = event.field;
    App.select2(field);
    App.tinymce();

    $('.magicField', field).each(function(){
      ToggleFieldBySelection.init({
        selection:  $(this),
        wrapper:    $(this).data('mfwrapper'),
        field:      $(this).data('mfsegment')
      });
    });
  });

  // $(".sortable-panel").sortable({
  //   // axis: "y",
  //   // connectWith: ".connectedSortable",
  //   // placeholder: "ui-state-highlight",
  //   stop: function(e, ui) {
  //     var pos   = ui.item.index() + 1;
  //     var id    = ui.item.data('id');
  //     var data  = { 'id': id, 'position': pos};
  //     var url   = ui.item.data('url');

  //     $.ajax({
  //       url: url,
  //       type: "POST",
  //       data: data,
  //       success: function(data){
  //         // window.location.reload();
  //       },
  //       dataType: 'JSON'
  //     });
  //   }
  // }).disableSelection();
});

$(document).on('change', '.cb-advance', function(){
  isChecked = $(this).is(':checked')
  parent = $(this).parent().parent().parent().parent();
  unitPriceInput = parent.find('.resource_purchase_order_details_order_detail_unit_price')[0]
  unitPriceValue = $(unitPriceInput).find('input').val();
  quantityInput = parent.find('.resource_purchase_order_details_order_detail_quantity')[0]
  quantityValue = $(quantityInput).find('input').val();
  curInput = parent.find('.resource_purchase_order_details_order_detail_cur')[0]
  curValue = $(curInput).find('input').val();
  advanceAmountCal = unitPriceValue * quantityValue * exchangeRate(curValue);

  currentAdvanceAmount = $('#resource_advanced_amount').val();
  if (currentAdvanceAmount != '') {
    currentAdvanceAmount = parseFloat(currentAdvanceAmount)
  }

  advanceAmountSetter = 0.0
  if (isChecked) {
    if (currentAdvanceAmount == '') {
      advanceAmountSetter = advanceAmountCal
      $('#resource_advanced_amount').val(advanceAmountCal)
    } else {
      advanceAmountSetter = currentAdvanceAmount + advanceAmountCal
    }
  } else {
    advanceAmountSetter = currentAdvanceAmount - advanceAmountCal
  }

  $('#resource_advanced_amount').val(advanceAmountSetter);
});

function exchangeRate(cur){
  switch(cur) {
    case 'VND':
      return 1.0
    case 'USD':
      return 23300
    default:
      return 1.0
  }
}

function copyToClipboard(text) {
  var dummy = document.createElement("textarea");
  document.body.appendChild(dummy);
  dummy.value = text;
  dummy.select();
  document.execCommand("copy");
  document.body.removeChild(dummy);
  alert('Coppied!');
}