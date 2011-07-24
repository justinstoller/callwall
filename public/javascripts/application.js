$(function() {

  var server_domain = 'http://localhost:3000/';
  var speek_domain = 'http://api.speek.com/calls/';
  var organizer = '';

  $('#search').submit(function() {
    organizer = $('#organizer');
    $.get({
      url: search_domain + 'search',
      data: {
        zip: $('#zip').value
      },
      success: function(data) {
       // build something with the object passed back from the server
      }
    });
    return false;
  });

  $('.call').click(function() {
    number = $(this).number;
    $.post({
      url: speek_domain + 'callNow',
      data: {
        api_key: api_key,
        format: "json",
        description: "A Call Wall demo",
        music_on_hold: 0,
        organizer: organizer,
        numbers: number
      },
      success: function(data) {
       // build something with the object passed back from the server
      }
    });
    return false;
  });
});
