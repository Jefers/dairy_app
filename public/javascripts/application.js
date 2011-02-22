// $('.cart').replaceWith(<%= escape_javascript(render :partial => 'cart') %>)

$(function() { 
  $('#date').datepicker();
});

$(document).ready(function(){
  $("button").click(function(){
    $(".productImage").toggle();
  });
});

$('a[data-remote=true]').livequery('click', function() {
    $.ajax({ 
      url: this.href, 
      dataType: "script"
    }); 
    return false; 
});
 

$('form[data-remote=true]').livequery('submit', function() {
  return request({ url : this.action, type : this.method, data : $(this).serialize() });
});

$(function() {
  $(".balert").click(function() {
    alert(this.getAttribute("data-confirm"));
    return false;
  })
});

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


