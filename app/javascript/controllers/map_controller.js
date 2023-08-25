import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    url: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
    this.map.on('load', () => {
      this.getSearchValue()
    });
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


  getSearchValue() {
    const searchBar = document.querySelector(".mapboxgl-ctrl-geocoder--input")
    searchBar.addEventListener('keyup', () => {
      fetch(`${this.urlValue}?query=${searchBar.value}`)
      .then(response => response.text())
      .then(data => {
        document.querySelector(".cards-results").innerHTML = data
      })

    })
  }
}
