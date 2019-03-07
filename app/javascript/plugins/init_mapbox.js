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
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

      const element = document.createElement('div');
  element.className = 'marker';
  element.innerText = `${marker.image_url}$`;
  element.style.color = 'blue';
  element.style.fontWeight = 'bold';

  element.style.backgroundSize = 'contain';
  element.style.width = '30px';
  element.style.height = '30px';

  // Pass the element as an argument to the new marker
  new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
    .setHTML(marker.infoWindow.content))
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
