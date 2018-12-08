# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

String::capitalize = ->
  @replace /\w\S*/g, (txt) ->
    txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase()

calendarSelectCallback = ->
  select = $('.calendar-select')
  val = select.val().capitalize()
  select.val(val)
  select.removeClass('error')

  obj = $('#calendar-datalist').find('option[value=\'' + val + '\']')
  if obj != null and obj.length > 0
    $(".show-calendar-button").removeClass('d-none')
    $(".create-calendar-button").addClass('d-none')
  else
    $(".show-calendar-button").addClass('d-none')
    $(".create-calendar-button").removeClass('d-none')

calendarCreateSuccessCallback = (data) ->
  console.log(data)

calendarCreateErrorCallback = () ->
  $('.calendar-select').addClass('error')

$ ->
  $.ajaxSetup headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

  $(".calendar-select").on 'input',  ->
    setTimeout(calendarSelectCallback, 100)

  $(".create-calendar-button").on 'click', ->
    $.ajax({
      type: "POST",
      url: '/calendars.json',
      data: { calendar: {name: $('.calendar-select').val()} }
      success: calendarCreateSuccessCallback()
      error: calendarCreateErrorCallback()
    });

  $(".show-calendar-button").on 'click', ->
    $.ajax({
      type: "POST",
      url: '/calendars.json',
      data: { calendar: {name: $('.calendar-select').val()} }
      success: calendarCreateSuccessCallback()
      error: calendarCreateErrorCallback()
    });

  $(".toggle-help").on 'click', (event) ->
    if($('.help-card').hasClass('d-none'))
      $('.help-card').removeClass('d-none')
    else
      $('.help-card').addClass('d-none')
    event.preventDefault();
