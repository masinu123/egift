Dropzone.autoDiscover = false;

var App = (function () {

  App.dropzone = function () {
    'use strict'
    function init() {
      if (0 == $('.dropzone').length) {
        return;
      }

      $(".dropzone").each(function(){
        var $this = $(this);
        $this.dropzone({
          params: { 'resource[record_type]': $this.data('recordType'), 'resource[record_id]': $this.data('recordId'), 'resource[name]': $this.data('name') },
          headers: { 'X-CSRF-Token': $('meta[name=csrf-token]').attr('content') },
          url: $this.attr("action"),
          addRemoveLinks: true,
          maxFiles: $this.data("maxFiles") ? parseInt($this.data("maxFiles")) : null,
          init: function() {
            var records = $this.data('records');
            for (let index = 0; index < records.length; index++) {
              const record = records[index];
              this.emit("addedfile", record);                                
              this.emit("thumbnail", record, record.url);
              this.files.push(record);
            }
          },
          removedfile: function(file) {
            $.ajax({
              url: "/oms/attachments/"+file.id+".json",
              type: "DELETE",
              data: { 'record_type': $this.data('recordType'), 'record_id': $this.data('recordId') },
              success: function (resp) {},
            });
  
            var _ref;
            if ((_ref = file.previewElement) != null) {
              _ref.parentNode.removeChild(file.previewElement);
            }
            return this._updateMaxFilesReachedClass();
          },
          success: function(file, resp) {
            file.id = resp.data.id;
            file.url = resp.data.url;
            // file.name = resp.data.name;
            return file.previewElement.classList.add("dz-success");
          }
        });
      });
    }

    init();
  };

  return App;

})(App || {});
