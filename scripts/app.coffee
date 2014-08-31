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
  if $('html').hasClass('page-index')
    requirejs ['home']
  else
    requirejs ['anchor']
