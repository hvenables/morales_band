$(document).on 'turbolinks:load', ->
  $('.mute-icon').click ->
    console.log('hello')
    if $('.background-music').filter('[muted=true]').length > 0
      $('.background-music').attr('muted', false).prop('muted', false)
      $('.mute-icon .fas').removeClass('fa-volume-off').addClass('fa-volume-up')
    else
      $('.background-music').attr('muted', true).prop('muted', true)
      $('.mute-icon .fas').removeClass('fa-volume-up').addClass('fa-volume-off')
