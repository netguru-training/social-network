# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  geolocation_fn = (position) ->
    links = $('a.signin[href]')
    for link in links
      link = $(link)
      old_href = link.attr('href')
      link.attr('href', "#{old_href}?lat=#{position.coords.latitude}&long=#{position.coords.longitude}")

  if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(geolocation_fn)
