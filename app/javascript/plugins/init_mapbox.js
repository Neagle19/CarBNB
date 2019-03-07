import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = "url('')"
  element.innerText = `${marker.price}$`;
  element.style.color = 'blue';
  element.style.fontWeight = 'bold';
  element.style.width = '25px';
  element.style.height = '25px';
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // <-- add this
  // Pass the element as an argument to the new marker
   new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup) // add popups
    .addTo(map);

  });
}
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
      map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));

  }
};

export { initMapbox };
