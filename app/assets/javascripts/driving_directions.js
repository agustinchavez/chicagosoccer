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


// $(document).ready(function(){

//   var location = $("#location")

//   $('#button').one('click', function(event){

//     event.preventDefault();
//     whereAmI();

//     function whereAmI() {

//       if (!navigator.geolocation){
//         location.html("<p>Geolocation isn't supported by your browser yet. Please enter your address in the form.</p>");
//         return;
//       }

//       function success(position) {
//         var latitude  = position.coords.latitude;
//         var longitude = position.coords.longitude;

//         location.attr("data-lat", latitude)
//         location.attr("data-lng", longitude)

//         location.html('<p>Latitude is ' + latitude + '° <br>Longitude is ' + longitude + '°</p>');


//         var user_location = {lat: location.attr("data-lat"), lng: location.attr("data-lng")};

//         request = $.ajax({
//           url: "pitchs/getlatlng",
//           method: "post",
//           data: user_location
//         })
//         .done(function(response){
//           location.append(response);
//         });

//       };

//       function error(error) {
//         switch(error.code) {
//         case error.PERMISSION_DENIED:
//         location.html("User denied the request for Geolocation.")
//         break;
//         case error.POSITION_UNAVAILABLE:
//         location.html("Location information is unavailable.")
//         break;
//         case error.TIMEOUT:
//         location.html("The request to get user location timed out.")
//         break;
//         case error.UNKNOWN_ERROR:
//         location.html("An unknown error occurred.")
//         break;
//         }
//       };

//       location.innerHTML = "<p>Locating…</p>";

//       navigator.geolocation.getCurrentPosition(success, error);
//     }

//   })

// })