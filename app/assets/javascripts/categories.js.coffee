# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  for category in $('.category')
    $category = $(category)
    text = $category.find($('h2')).text()
    pattern = GeoPattern.generate(text);
    $category.css('background-image', pattern.toDataUrl());
