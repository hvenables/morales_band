$(document).on 'turbolinks:load', ->
  isChrome =
    /Chrome/.test(navigator.userAgent) and /Google Inc/.test(navigator.vendor)

  isSafari =
    /^((?!chrome|android).)*safari/i.test(navigator.userAgent)

  isMobile =
    /Mobi/.test(navigator.userAgent)

  if !isChrome
    $('#iframeAudio').remove()
  else
    $('.background-music').remove()

  if isSafari || isMobile
    $('.background-music').attr('muted', true).prop('muted', true)
    $('.mute-icon .fas').removeClass('fa-volume-up').addClass('fa-volume-off')


  $('.mute-icon').click ->
    if !isChrome
      muteAudioTag()
    else
      muteIframeTag()

  $('#modal').on 'shown.bs.modal', ->
    $('#mail-list-email-input').trigger('focus')
    $('#mail-list-form').on 'submit', ->
      $('#modal').modal('hide')

muteAudioTag = ->
  if $('.background-music').filter('[muted=true]').length > 0
    $('.background-music').attr('muted', false).prop('muted', false)
    $('.mute-icon .fas').removeClass('fa-volume-off').addClass('fa-volume-up')
  else
    $('.background-music').attr('muted', true).prop('muted', true)
    $('.mute-icon .fas').removeClass('fa-volume-up').addClass('fa-volume-off')

muteIframeTag = ->
  $video = $('#iframeAudio').contents().find('video')
  if $video.filter('[muted=true]').length > 0
    $video.attr('muted', false).prop('muted', false)
    $('.mute-icon .fas').removeClass('fa-volume-off').addClass('fa-volume-up')
  else
    $video.attr('muted', true).prop('muted', true)
    $('.mute-icon .fas').removeClass('fa-volume-up').addClass('fa-volume-off')

