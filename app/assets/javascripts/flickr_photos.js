
function initialize() {
  lat = 37.775;
  lng = -122.437;
  var mapOptions = {
    center: new google.maps.LatLng(lat, lng),
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"),
      mapOptions);
  ping_ajax();

  function ping_ajax(){
    jQuery.ajax({
      data: 'lat=' + lat + '&lng=' + lng,
      type: "GET",
      dataType: "json",
      url: "/photos/new_set",
      success:  function(data) { 
        //alert( "Successful AJAX!!! " + data.url);
        document.getElementById("headline_img").src = data.url;
        document.getElementById("warnings").innerHTML = "";
      },
      error: function(data){
        //alert('failure' + data);
        document.getElementById("warnings").innerHTML = "No new images found!";
      },
      complete: function(request, textStatus) { //for additional info
        //alert(request.responseText);
        //alert(textStatus);
      }
    });
  }

  google.maps.event.addListener(map, 'dragend', function() {
    document.getElementById("warnings").innerHTML = "retrieving...";
    center = document.getElementById("latitude").innerHTML = map.getCenter();
    lat = center.lat();
    lng = center.lng();
    ping_ajax();

  });
}

function next_photo(){
  jQuery.ajax({
    type: "GET",
    dataType: "json",
    url: "/photos/random",
    success:  function(data) { 
      document.getElementById("headline_img").src = data.url;
      document.getElementById("warnings").innerHTML = "Like em?";
    },
    error: function(data){
      document.getElementById("warnings").innerHTML = "No new images found!";
    }
  });
}
