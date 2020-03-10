$(document).on('turbolinks:load', function () {
  setTimeout(function () {
    $('.alert').fadeOut('slow');
  }, 5000);
})
