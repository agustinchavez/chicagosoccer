var panorama;
function initStreet(pitchLat, pitchLng) {
  panorama = new google.maps.StreetViewPanorama(
    document.getElementById('street_view'),
    {
      position: {lat: pitchLat, lng: pitchLng},
      pov: {heading: 0, pitch: 0},
      zoom: 1
    });
}