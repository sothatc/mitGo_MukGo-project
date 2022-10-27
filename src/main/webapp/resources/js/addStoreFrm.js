$(document).ready(function () {
  $('input.timepicker').timepicker({});
});
(function ($) {
  'use strict';
  $(function () {
    $('.file-upload-browse').on('click', function () {
      var file = $(this).parent().parent().parent().find('.file-upload-default');
      file.trigger('click');
    });
    $('.file-upload-default').on('change', function () {
      // $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
      
      const list = this.files;
      let fileList = "";
      for (let i = 0; i < list.length; i++) {
        fileList += list[i].name + '     ';
      }
      $(this).parent().find('.form-control').val(fileList);
    });
  });
})(jQuery);
$('.time').timepicker({
  timeFormat: 'HH:mm',
  interval: 30,
  startTime: '24:00',
  dynamic: false,
  dropdown: true,
  scrollbar: true
});

function addrSlice() {
  const addr = $("#inputAddress1").val();
  const splitWord = addr.split("*");
  for (let i = 0; i < splitWord.length; i++) {
  }
  $("#inputAddress1").val(splitWord[0]);
  $("#inputAddress2").val(splitWord[1]);
  $("#detailAddress").val(splitWord[2]);
}
addrSlice();

function searchPost() {
  new daum.Postcode({
    oncomplete: function (data) {

      $("#inputAddress1").val(data.zonecode);
      $("#inputAddress2").val(data.roadAddress);
      $("#detailAddress").focus();
    }
  }).open();
}