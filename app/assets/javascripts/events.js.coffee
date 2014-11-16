# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  info_height = $("#event-info").height()
  $("#image").height(info_height)
  img_size = Math.min( $("#image").height(), $("#image").width() )
  $("#image img").height( img_size ).width( img_size )
