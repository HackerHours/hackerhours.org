---
---

requirejs.config(
  paths:
    URIjs: '../bower_components/URIjs/src'
    jquery: 'https://code.jquery.com/jquery-2.1.1.min'
    jsonp: '../bower_components/jsonproxy/jsonp'
    moment: 'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min'
  shim:
    jsonp: ['jquery']
)

require ['jquery'], ($) ->
  # routing
  if $('html').hasClass('page-index')
    require ['home']
  else
    require ['anchor']
