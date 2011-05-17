
$(document).ready(function() {
/* Activating Best In Place */
jQuery(".best_in_place").best_in_place()
});

$(document).ready(function(){
  /* Highlight the flash messages */
  $("#flash").click(function () {
        $(this).effect.hide("highlight", {}, 9000);
  });
});

jQuery(document).ready(function() {
  /* Fade out the flash messages */
  var $box = $('#flash');
  if ($box.is(':visible')) {
    $box.hide("highlight", {}, 9000);
  }
});

jQuery(document).ready(function() {
  $( "#tabs" ).tabs();
});

$(document).ready(function() {
  $('div.accordionButton').click(function() {
    $('div.accordionContent').slideUp('normal');
    $(this).next().slideDown('normal');
  });
  $("div.accordionContent").hide();
});

/* create an array of days which need to be disabled  :todo ruby program to generate array of days */
var disabledDays = ["5-30-2011","8-29-2011","12-26-2011","12-27-2011","1-2-2012","4-6-2012"];

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

function noSundaysOrHolidays(date) {
  var noWeekend = jQuery.datepicker.noWeekends(date);
  return noWeekend[0] ? nationalDays(date) : noSundays(date);
}

function noSundays(date) {
    var day = date.getDay();
    return [(day != 0), ''];
}

/* create datepicker */
jQuery(document).ready(function() {
  jQuery('#order_required_date').datepicker({
    minDate: 2,
    maxDate: 90,
    dateFormat: 'DD, MM, d, yy',
    constrainInput: true,
    beforeShowDay: noSundaysOrHolidays
  });
});

jQuery(document).ready(function() {
  jQuery('#customer_holiday_from_date').datepicker({
    minDate: 2,
    dateFormat: 'DD, MM, d, yy'
  });
});

jQuery(document).ready(function() {
  jQuery('#customer_holiday_to_date').datepicker({
    minDate: 2,
    dateFormat: 'DD, MM, d, yy'
  });
});

$(document).ready(function(){
  $('input.ui-datepicker').datepicker();
});

// $(function() {
//   $('#date').datepicker({ dateFormat: 'dd MM, yy' });
// });

$(document).ready(function() {
  // create a convenient toggleLoading function
  var showLoading = function() { $("#loading").show() };
  var hideLoading = function() { $("#loading").hide() };

  $("#cart-form")
    .bind("ajax:beforeSend",  showLoading)
    .bind("ajax:complete", hideLoading)
    .bind("ajax:success", function(s, data, status, xhr) {
      $("#response").html(status);
      var flash = XMLHttpRequest.getResponseHeader("X-Flash");
      $("#flash").html(flash);
      alert(s);
      alert(xhr);
      alert(status);
      alert(data);
    });
});


$(document).ready(function() {
  $('th').click(function(event) {
    if ( $(this).hasClass('highlight_tr') ) {
        $(this).removeClass('highlight_tr');
    } else {
        $(this).addClass('highlight_tr');
    }
  });
});

$(document).ready(function() {
  $('tr').click(function(event) {
    $(this).effect("highlight", {}, 24000);
  });
});

$(document).ready(function(){
  $("#tabnav li").click(function () {
        $(this).effect("highlight", {}, 12000);
  });
});

$(document).ready(function(){
  $("#h3").click(function () {
        $(this).effect("pulsate", { times:3 }, 2000);
  });
});

$(document).ready(function() {
    $('#cart-form').click(function () {
          $("#jcart").effect("highlight", {}, 3000);
    });
});


$(document).ready(function(){
  $(".productImage").show(); // Hide div by default
  $("button#pictureButton").click(function(){
    $(".productImage").toggle();
  });
});

$(function() {
  $(".balert").click(function() {
    alert(this.getAttribute("data-confirm"));
    return false;
  })
});

// :todo is this really needed?
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

$(document).ready(function(){
  $("#telephone").click(function () {
        $(this).effect("puff");
  });
});

