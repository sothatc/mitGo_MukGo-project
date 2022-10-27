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
        $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
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