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
    $(".edit-calendar-button").removeClass('d-none')
    $(".create-calendar-button").addClass('d-none')
  else
    $(".edit-calendar-button").addClass('d-none')
    $(".create-calendar-button").removeClass('d-none')

calendarCreateErrorCallback = ->
  $('.calendar-select').addClass('error')

showHideHelp = ->
  if window.showHelp
    $('.help-card').removeClass('d-none')
  else
    $('.help-card').addClass('d-none')


toggleHelp = ->
  window.showHelp = !window.showHelp
  showHideHelp()

editCalendar = ->
  name = $('.calendar-select').val()
  $('.edit-calendar').load('/calendar/'+name+'/edit.html', ->
    showHideHelp()
  )

$ ->
  $.ajaxSetup headers: 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')

  window.showHelp = false;

  $(".calendar-select").on 'input',  ->
    setTimeout(calendarSelectCallback, 100)

  $(".create-calendar-button").on 'click', ->
    $.ajax({
      type: "POST"
      url: '/calendars.json'
      data: { name: $('.calendar-select').val() }
      success: editCalendar
      error: calendarCreateErrorCallback
    })

  $('.edit-calendar').on 'click', '.update-calendar-button', ->
    $.ajax({
      type: "POST",
      type: 'PUT',
      url: $('.update-calendar-form').attr('action')
      data: $(".update-calendar-form").serialize()
      #success: editCalendar
      #error: calendarCreateErrorCallback
    })


  $(".edit-calendar-button").on 'click', ->
    editCalendar()

  $(".toggle-help").on 'click', (event) ->
    toggleHelp()
    event.preventDefault();
