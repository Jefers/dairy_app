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

/* create an array of days which need to be disabled  :TODO ruby program to generate array of days */
var disabledDays = ["2-21-2011","2-24-2011","2-27-2011","2-28-2011","3-3-2011","3-17-2011","4-2-2011","4-3-2011","4-4-2011","4-5-2011"];

/* utility functions */
function nationalDays(date) {
  var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
  //console.log('Checking (raw): ' + m + '-' + d + '-' + y);
  for (i = 0; i < disabledDays.length; i++) {
    if($.inArray((m+1) + '-' + d + '-' + y,disabledDays) != -1 || new Date() > date) {
      //console.log('bad:  ' + (m+1) + '-' + d + '-' + y + ' / ' + disabledDays[i]);
      return [false];
    }
  }
  //console.log('good:  ' + (m+1) + '-' + d + '-' + y);
  return [true];
}
function noWeekendsOrHolidays(date) {
  var noWeekend = jQuery.datepicker.noWeekends(date);
  return noWeekend[0] ? nationalDays(date) : noWeekend;
}

/* create datepicker :TODO clean these up when the generic one is figured out */
jQuery(document).ready(function() {
  jQuery('#order_required_date').datepicker({
    minDate: new Date(2011, 0, 1),
    maxDate: new Date(2011, 5, 31),
    dateFormat: 'DD, MM, d, yy',
    constrainInput: true,
    beforeShowDay: noWeekendsOrHolidays
  });
});

jQuery(document).ready(function() {
  jQuery('#customer_holiday_from_date').datepicker({
    dateFormat: 'DD, MM, d, yy'
  });
});

jQuery(document).ready(function() {
  jQuery('#customer_holiday_to_date').datepicker({
    dateFormat: 'DD, MM, d, yy'
  });
});

$(document).ready(function(){
  $('input.ui-datepicker').datepicker();
});

// $(function() {
//   $('#date').datepicker({ dateFormat: 'dd MM, yy' });
// });

$(function() {
  // create a convenient toggleLoading function
  var toggleLoading = function() { $("#loading").toggle() };

  $("#cart-form")
    .bind("ajax:loading",  toggleLoading)
    .bind("ajax:complete", toggleLoading)
    .bind("ajax:success", function(evt, data, status, xhr) {
      $("#response").html(status);
    });
});

// $('.cart').replaceWith(<%= escape_javascript(render :partial => 'cart') %>)


// $('.auto_search_complete').autocomplete({
//     minLength: 3,
//     delay: 600,
//     source: function(request, response) {
//         $.ajax({
//             url: "/autocomplete.js",
//             dataType: "json",
//             data: {term: request.term},
//             success: function( data ) {
//                 response( data );
//             }
//         });
//     }
// });



$(document).ready(function(){
  $("#per_page value").keyup(function() {
      alert( $.cookie("perPage") );
    return false;
  });

});

$(document).ready(function(){
  $.cookie("perPage", "25", { path: '/' }); // , { path: '/', domain: 'www.example.com' });
});

$(document).ready(function(){
  $("#preferences").hide(); // Hide div by default
  $("button#preferenceButton").click(function(){
    $("#preferences").toggle();

  });
});

$(document).ready(function(){
  $(".productImage").hide(); // Hide div by default
  $("button#pictureButton").click(function(){
    $(".productImage").toggle();
  });
});

// $('a[data-remote=true]').livequery('click', function() {
//     $.ajax({
//       url: this.href,
//       dataType: "script"
//     });
//     return false;
// });


// $('form[data-remote=true]').livequery('submit', function() {
//   return request({ url : this.action, type : this.method, data : $(this).serialize() });
// });

$(function() {
  $(".balert").click(function() {
    alert(this.getAttribute("data-confirm"));
    return false;
  })
});

// TODO is this really needed?
$(function() {
  $("#products th a, #products .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#products_search input").keyup(function() {
    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
    return false;
  });
});


