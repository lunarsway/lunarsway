// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function setupJoinMailingList() {
  $(function () {
    $('#mailing_list_join').val('your email address');
    $('#mailing_list_join').focus(function() {
      if ($(this).val() == 'your email address') {
        $(this).val('');
      }
    });
    $('#mailing_list_join').blur(function() {
      if ($(this).val() == '') {
        $(this).val('your email address');
      }
    });
    $('#mailing_list_form').submit(function () {
      if ($('#mailing_list_join').val() != '' && $('#mailing_list_join').val().match('@') && $('#mailing_list_join').val().match('.')) {
        $('#mailing_list_form').ajaxSubmit(
          {success: function() {
            alert('Thanks for joining mailing list!');
            $('#mailing_list_join').val('your email address');            
          }}
        );
        return false;
      } else {
        alert("Be sure to enter a valid email address!");        
        return false;
      }      
    });  
  });
}

function doJoinMailingList() {
  if ($('#mailing_list_join').val() != '' && $('#mailing_list_join').val().match('@') && $('#mailing_list_join').val().match('.')) {
    $.post('/mailing_list_items/create', {email: $('#mailing_list_join').val(), authenticity_token: token}, function(data) {
      alert('Thanks for joining our mailing list!');
      $('#mailing_list_join').val('');
    });
  } else {
    alert("Be sure to enter a valid email address!");
  }
}

function setupReleases()