$ ->
  $('#geolocation').height($(window).height() - $('.navbar-default').height() - 10)
  console.log $('#geolocation').height()
  @handler = Gmaps.build('Google')
  @handler.buildMap({ internal: {id: 'geolocation'}}, build)

build = ->
  marker =
    "lat": 0,
    "lng": 0,
    "picture": {
      "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
      "width":  36,
      "height": 36
    },
    "infowindow": "hello!"
  markers = @handler.addMarkers([marker])
  @handler.bounds.extendWith(markers)
  @handler.fitMapToBounds()