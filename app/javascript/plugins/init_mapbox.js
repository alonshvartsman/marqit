import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = (longitude, latitude) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [34.7743034, 32.0779315],
    zoom: 15,
    attributionControl: false
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup) // add this
          .addTo(map)
      });
    };


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 10, duration: 1500 });
};

const addGeolocateControl = (map) => {
  map.addControl(
    new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
    trackUserLocation: true
    })
  );
}

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    // uncomment this to debug the map in the console
    // window.map = map;
    addGeolocateControl(map)
    if (mapElement.dataset.markers) {
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  }
};
//Add geolocate control to the map.

//   const mapElementNumber2 = document.getElementById('map2');

//   const buildMapNumber2 = (longitude, latitude) => {
//   mapboxgl.accessToken = mapElementNumber2.dataset.mapboxApiKey;
//     let map = new mapboxgl.Map({
//       container: 'map2',
//       style: 'mapbox://styles/mapbox/streets-v10',
//       center: [34.7743034, 32.0779315],
//       zoom: 12.5,
//       attributionControl: false
//   });






export { initMapbox };




















