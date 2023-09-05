var App = (function () {

  App.advancedUpload = function () {
    'use strict'
    function init() {
      $('body').on('change', '.media_advanced[type=file]', function (e) {
        var data = $('.advanced_border').attr('class').split(' ');
        if (e.target.files && e.target.files.length > 0) {
          uploadAdvanced(e.target.files[0], $(this));
        }
      });

      $('body').on('click', '.previewBoxItem button.upload', function (e) {
        e.preventDefault();
        var wp = $(this).parent().parent().parent();
        $('input[type=file]', wp).trigger('click');
      });

      $('body').on('click', '.previewBoxItem button.delete', function (e) {
        e.preventDefault();
        var wp = $(this).parent().parent().parent();
        $('.previewBoxItem', wp).fadeOut();
        $('img', wp).attr('src', '');
        $('input[type=file]', wp).val(null).fadeIn();
        
        // Add _destroy input
        var rootWp = wp.parent();
        var attachmentIdCloned = rootWp.next().clone();
        attachmentIdCloned.attr('name', attachmentIdCloned.attr('name').replace("id", "_destroy"))
        attachmentIdCloned.attr('id', attachmentIdCloned.attr('id')+'_destroy')
        attachmentIdCloned.val('1')
        rootWp.parent().append(attachmentIdCloned);
      });
    }

    function uploadAdvanced(file, el) {
      $('.loader-container').show();
      var formData = new FormData();
      formData.append("resource[attachment_type]", getTypeAttachment(window.location.pathname));
      formData.append("resource[file]", file);
      $.ajax({
        url: "/oms/attachments.json",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (result) {
          if (result && result.data && result.data.id) {
            appendTo(el, result.data);
            $('.loader-container').hide();
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          $('.loader-container').hide();
          alert('Upload Failed!\n' + jqXHR.responseJSON.message + '\nPlease try again later!');
        }
      });
    }

    function appendTo(el, data) {
      var wp = el.parent();
      var suffix = el.attr('data-suffix');
      var prefix = el.attr('data-prefix');
      $('.previewBoxItem', wp).fadeIn();
      $('.previewBoxItem a.file-link', wp).remove();
      if (data.content_type && data.content_type.includes("image")) {
        $('.previewBoxItem img', wp).attr('src', (prefix || '') + data.url + (suffix || ''));
      } else {
        $('.previewBoxItem', wp).prepend('<a href="' + data.url + '" class="file-link" target="blank">Uploaded file link</a>')
      }
      $(el.data('target'), wp).val(data.id);
      $('input[type=file]', wp).fadeOut();
    }

    init();
  };

  return App;

})(App || {});
