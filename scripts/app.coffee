---
---

requirejs.config(
    paths:
      jquery: '//code.jquery.com/jquery-2.1.1.min'
      jsonp: '../bower_components/jsonproxy/jsonp'
      moment: '//cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min'
    shim:
      jsonp: ['jquery']
)

requirejs ['jquery'], ($) ->
  # routing
  $html = $('html')
  if $html.hasClass('page-index')
    requirejs ['home']
  else if $html.hasClass('page-meet')
    requirejs ['meet']
  else
    requirejs ['anchor']
