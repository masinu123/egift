var App = (function () {

  App.feditor = function () {
    'use strict'

    function init() {
      new FroalaEditor('.feditor', {
        key: FROALA_EDITOR_KEY,
        toolbarButtons: {
          'moreText': {
            'buttons': ['bold', 'italic', 'underline', 'fontSize', 'textColor', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'backgroundColor', 'inlineClass', 'inlineStyle', 'clearFormatting'],
            'buttonsVisible': 5
          },
          'moreParagraph': {
            'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'paragraphFormat', 'paragraphStyle', 'lineHeight', 'outdent', 'indent', 'quote']
          },
          'moreRich': {
            'buttons': ['insertLink', 'insertImage', 'insertVideo', 'insertTable', 'emoticons', 'fontAwesome', 'specialCharacters', 'embedly', 'insertFile', 'insertHR']
          },
          'moreMisc': {
            'buttons': ['undo', 'redo', 'fullscreen', 'print', 'getPDF', 'selectAll', 'html', 'help'],
            'align': 'right',
            'buttonsVisible': 2
          }
        },
        toolbarButtonsXS: {
          'moreText': {
            'buttons': ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', 'textColor', 'backgroundColor', 'inlineClass', 'inlineStyle', 'clearFormatting'],
            'buttonsVisible': 0
          },
          'moreParagraph': {
            'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'paragraphFormat', 'paragraphStyle', 'lineHeight', 'outdent', 'indent', 'quote'],
            'buttonsVisible': 0
          },
          'moreRich': {
            'buttons': ['insertLink', 'insertImage', 'insertVideo', 'insertTable', 'emoticons', 'fontAwesome', 'specialCharacters', 'embedly', 'insertFile', 'insertHR'],
            'buttonsVisible': 0
          },
          'moreMisc': {
            'buttons': ['undo', 'redo', 'fullscreen', 'print', 'getPDF', 'selectAll', 'html', 'help'],
            'align': 'right',
            'buttonsVisible': 2
          }
        },
        toolbarSticky: true,
        placeholderText: 'Write your content here',
        // heightMin: 240,
        // height: 600,
        events: {
          'image.beforeUpload': function (images) {
            let editor = this;
            const image = images && images.length > 0 && images[0] ? images[0] : null;
            if (!!image) {
              froalaUpload(editor, image, "image");
            }
            return false;
          },
          'video.beforeUpload': function (videos) {
            let editor = this;
            const video = videos && videos.length > 0 && videos[0] ? videos[0] : null;
            if (!!video) {
              froalaUpload(editor, video, "video");
            }
            return false;
          }
        }
      });
    }

    function froalaUpload(editor, file, type) {
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
          if (result && result.data && result.data.url) {
            switch (type) {
              case "image":
                editor.image.insert(result.data.url + '?max-w=1000', true, null, editor.image.get(), null)
                break;
              case 'video':
                editor.video.insert(
                  '<video width="320" height="240" controls><source src="' + result.data.url + '"></video>'
                );
                break;
            }
          }
          $('.loader-container').hide();
        },
        error: function (jqXHR, textStatus, errorThrown) {
          $('.loader-container').hide();
          alert('Upload Failed!\n' + jqXHR.responseJSON.message + '\nPlease try again later!');
        }
      });
    }
    init();
  };
  return App;
})(App || {});
