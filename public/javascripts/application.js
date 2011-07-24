(function($) {
  $(document).ready(function() {
    var server_domain = 'http://pure-window-301.heroku.com/';
    var organizer = '';

    $('#searchform').submit(function() {
      organizer = $('#phone-zip').val();
      var path = server_domain + 'search';
      var orig_profile = $('div.rep');
      $.post(path, { "zip": $('#search-zip').val() }, function(data) {
        for(i = 0; i < data.length; i++) {
          var person = data[i]['person'];
          var profile = orig_profile.clone(true, true);
          $('div.rep-pic', profile).prepend('<img src="' + server_domain + person['image_link'] + '" />');
          $('div.rep-name', profile).html(person['first_name'] + ' ' + person['last_name']);
          $('div.rep-title', profile).html(person['position']);
          $('div#content-reps-holder').prepend(profile);
          var orig_contact_form = $('div.rep-phone', profile);
          $.each(person['contacts'], function(index, contact) {
            contact_form = orig_contact_form.clone(true, true);
            link = $('a', contact_form);
            link.data('number', '1' + contact['number']);
            link.attr('title', '(' + contact['number'].slice(0,3) +') ' + contact['number'].slice(3,6) + '-' + contact['number'].slice(6));
            link.html(contact['location_city']);
            contact_form.click(function() {
              number = $('a', this).data('number');
              var path = server_domain + 'call';
              $.post(path, { "organizer": organizer, "numbers": number },
                  function(data) {
                }
              );
              return false;
            });
            profile.append(contact_form);
          });
          orig_contact_form.remove();
          orig_contact_form = null;
        }
        orig_profile.remove();
        orig_profile = null;
      });
      return false;
    });
  });
})(jQuery);
