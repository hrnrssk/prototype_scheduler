# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#flow_processing_id', ->
  $.ajax(
    type: 'GET'
    url: '/workings/get_users'
    data: {
      processing_id: $(this).val()
    }
  ).done (data) ->
    $('.worker').html(data)

$(document).on 'change', '#flow_processing_id', ->
  $.ajax(
    type: 'GET'
    url: '/processings/get_equipment_schedule'
    data: {
      processing_id: $(this).val()
    }
  ).done (data) ->
    $('.equipment_schedule').html(data)


$(document).on 'change', '#flow_user_id', ->
  $.ajax(
    type: 'GET'
    url: '/processings/get_user_schedule'
    data: {
      user_id: $(this).val()
    }
  ).done (data) ->
    $('.user_schedule').html(data)

