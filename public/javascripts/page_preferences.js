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
