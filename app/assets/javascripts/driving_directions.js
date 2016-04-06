function initDriving(user_lat, user_lng, pitch_lat, pitch_lng) {
  var user = {lat: user_lat, lng: user_lng};
  var pitch = {lat: pitch_lat, lng: pitch_lng};

  var directionsDisplay = new google.maps.DirectionsRenderer;
  var directionsService = new google.maps.DirectionsService;

  var map = new google.maps.Map(document.getElementById('driving_map'), {
    zoom: 5,
    center: user
  });

  directionsDisplay.setMap(map);
  directionsDisplay.setPanel(document.getElementById('driving_directions'));

  calculateAndDisplayRoute(directionsService, directionsDisplay);


  function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    var start = user;
    var end = pitch;
    directionsService.route({
      origin: start,
      destination: end,
      travelMode: google.maps.TravelMode.DRIVING
    }, function(response, status) {
      if (status === google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
      } else {
        window.alert('Directions request failed due to ' + status);
      }
    });
  }
}
