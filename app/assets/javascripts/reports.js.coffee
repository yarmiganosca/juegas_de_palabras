# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# TODO: make the below code render properly with Twitter Bootstrap
""" 
$ = jQuery

get_words_array = (node) ->
  words_array = []
  $('[data-cloud-text][data-cloud-weight]', node).each ->
    words_array.push text: $(this).data('cloud-text'), weight: $(this).data('cloud-weight')
  return words_array

$(document).ready ->
  $('.report-findings').each ->
    $(this).css(width: '550px', height: '350px').jQCloud(get_words_array $(this)) 
"""