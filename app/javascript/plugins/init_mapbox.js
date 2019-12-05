import mapboxgl from 'mapbox-gl';

import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');
const DEFAULT_LOCATION = [34.7743034, 32.0779315];
let searchMarker = null;

const buildMap = (longitude, latitude) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    zoom: 15,
    center: DEFAULT_LOCATION,
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
  map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 1500 });
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

const onDragEnd = () => {
   // reverse geocode

}

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    addGeolocateControl(map)
    const geocoder = new MapboxGeocoder({
        accessToken: mapElement.dataset.mapboxApiKey,   // mapboxgl.accessToken
        mapboxgl: mapboxgl, // Set the mapbox-gl instance
        placeholder: 'Search Location',
        marker: null
    });
    if (mapElement.dataset.markers) {
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    } else {
      map.addControl(geocoder);
      window.map = map
      map.on('load', function() {
        searchMarker = new mapboxgl.Marker({
          draggable: true
        })
        // map.addSource('single-point', {
        //   type: 'geojson',
        //   data: {
        //     type: 'FeatureCollection',
        //     features: []
        //   },
        // });
        geocoder.on('result', function(ev) {
          console.log(ev)
          const location = ev.result.place_name
          const coords = ev.result.geometry.coordinates

          // set value of hidden field in form
          const locationField = document.getElementById('report_location')
          locationField.value = location

          const latitudeField = document.getElementById('report_latitude')
          latitudeField.value = coords[1]
          const longitudeField = document.getElementById('report_longitude')
          longitudeField.value = coords[0]

          searchMarker.remove()
          searchMarker = new mapboxgl.Marker({
            draggable: true
          })
            .setLngLat(coords)
            .on('dragend', onDragEnd)
            .addTo(map);

          // map.getSource('single-point').setData(ev.result.geometry);
        });
        const input = document.querySelector(".mapboxgl-ctrl-geocoder--input")
      });
    };
  };
};

export { initMapbox };
























