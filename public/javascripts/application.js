(function($) {
  $(document).ready(function() {
    var server_domain = 'http://localhost:3000/';
    var speek_domain = 'http://api.speek.com/calls/';
    var organizer = '';
    console.log("document ready");

    $('#searchform').submit(function() {
      organizer = $('#phone-zip');
      console.log(organizer.val());
      console.log($('#search-zip').val());
      var path = server_domain + 'search';
      console.log(path);
      $.post(path, { "zip": $('#search-zip').val() }, function(data) {
          $.each(data, function(index, user) {
            console.log(user);
            var person = user['person'];
            var orig_profile = $('div.rep');
            var profile = orig_profile.clone(true, true);
            $('div.rep-pic', profile).prepend('<img src="' + server_domain + person['image_link'] + '" />');
            $('div.rep-name', profile).html(person['first_name'] + ' ' + person['last_name']);
            $('div.rep-title', profile).html(person['position']);
            var orig_contact_form = $('div.rep-phone', profile);
            $.each(person['contacts'], function(index, contact) {
              contact_form = orig_contact_form.clone(true, true);
              link = $('a', contact_form);
              link.data('number', contact['number']);
              link.html(contact['location_city']);
              $('div#content-reps-holder').prepend(profile);
              contact_form.click(function() {
                number = $('a', this).number;
                $.post(speek_domain + 'callNow', {
                    "api_key": api_key,
                    "format": "json",
                    "description": "A Call Wall demo",
                    "music_on_hold": 0,
                    "organizer": organizer,
                    "numbers": number
                  }, function(data) {
                   // build something with the object passed back from the server
                  });
              });
              return false;
            });
            orig_contact_form.remove();
            orig_contact_form = null;
          });
        });
      return false;
    });
  });
})(jQuery);
