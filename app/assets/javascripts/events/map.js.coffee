$ ->
  if($('#geolocation').length)
    $('#geolocation').height($(window).height() - $('.navbar-default').height() - 10)
    @handler = Gmaps.build('Google')
    @handler.buildMap({ internal: {id: 'geolocation'}}, build)

build = ->
  json_markers = []
  json_markers.push $('.my').data()
  markers = @handler.addMarkers(json_markers)
  @handler.bounds.extendWith(markers)
  @handler.fitMapToBounds()