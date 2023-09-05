var App = (function () {

  App.tinymce = function () {
    'use strict'

    function init() {
      // var useDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
      var useDarkMode = false;
      $('textarea.tinymce').each(function(){
        console.log($(this));
        $(this).tinymce({
          plugins: 'print preview importcss searchreplace autolink autosave save directionality code visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor insertdatetime advlist lists wordcount textpattern noneditable help charmap quickbars emoticons',
          imagetools_cors_hosts: ['picsum.photos'],
          menubar: 'file edit view insert format tools table help',
          toolbar: 'undo redo | bold italic underline strikethrough | fontselect fontsizeselect formatselect | alignleft aligncenter alignright alignjustify | outdent indent |  numlist bullist | forecolor backcolor removeformat | pagebreak | charmap emoticons | fullscreen  preview save print | insertfile image media template link anchor codesample | ltr rtl',
          toolbar_sticky: true,
          autosave_ask_before_unload: true,
          autosave_interval: '30s',
          autosave_prefix: '{path}{query}-{id}-',
          autosave_restore_when_empty: false,
          autosave_retention: '2m',
          image_advtab: true,
          importcss_append: true,
          height: $(this).data('fullScreen') ? 'calc(100vh)' : 300,
          image_caption: true,
          quickbars_selection_toolbar: 'bold italic | quicklink h2 h3 blockquote quickimage quicktable',
          noneditable_noneditable_class: 'mceNonEditable',
          toolbar_mode: 'sliding',
          contextmenu: 'link image imagetools table',
          skin: useDarkMode ? 'oxide-dark' : 'oxide',
          content_css: useDarkMode ? 'dark' : 'default',
          content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }',
          paste_data_images: true,
          images_upload_handler: tinyMCEUpload,
          content_style: 'img {max-width: 50%;max-height: 50%;}',
          file_picker_callback: function (callback, value, meta) {
            var formData = new FormData();
            formData.append("resource[url]", value);
  
            uploadFile(formData, callback)
          },
        });
      });
    }

    function tinyMCEUpload(blobInfo, success, failure, progress) {
      var formData = new FormData();
      formData.append("resource[file]", blobInfo.blob());

      uploadFile(formData, success)
    }

    function uploadFile(formData, callback){
      formData.append("resource[attachment_type]", getTypeAttachment(window.location.pathname));

      $.ajax({
        url: "/oms/attachments.json",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (result) {
          callback(result.data.url + '?max-w=1000');
        },
        error: function (jqXHR, textStatus, errorThrown) {
          failure('Image upload failed due to Jquery AJAX. Code: ' + jqXHR.responseJSON.message);
        }
      });
    }

    init();
  };
  return App;
})(App || {});
