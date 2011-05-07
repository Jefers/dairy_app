
function initMenu() {
$('#menu ul').hide();
$('#menu li a').click(
  function() {
    $(this).next().slideToggle('normal');
    }
  );
}


$(document).ready(function() {initMenu();});

// validate signup form on keyup and submit
jQuery(document).ready(function() {
  $("#signupForm").validate({
          rules: {
                  password: {
                          required: true,
                          minlength: 6
                  },
                  confirm_password: {
                          required: true,
                          minlength: 6,
                          equalTo: "#password"
                  },
                  email: {
                          required: true,
                          email: true
                  },
                  terms_of_service: "required"
          },
          messages: {
                  password: {
                          required: "Please provide a password",
                          minlength: "Your password must be at least 6 characters long"
                  },
                  confirm_password: {
                          required: "Please provide a password",
                          minlength: "Your password must be at least 6 characters long",
                          equalTo: "Please enter the same password as above"
                  },
                  email: "Please enter a valid email address",
                  terms_of_service: "Please accept our policy"
          }
  });
});
