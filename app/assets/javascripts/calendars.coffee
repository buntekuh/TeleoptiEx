# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  calendarSelectCallback = ->
    val = $('.calendar-select').val()
    console.log val
    obj = $('#calendar-datalist').find('option[value=\'' + val + '\']')
    if obj != null and obj.length > 0
      $(".show-calendar-button").removeClass('d-none')
      $(".create-calendar-button").addClass('d-none')
    else
      $(".show-calendar-button").addClass('d-none')
      $(".create-calendar-button").removeClass('d-none')

  $(".calendar-select").on 'input',  ->
    setTimeout(calendarSelectCallback, 100)
