---
---

requirejs.config(
    paths:
      jquery: '//code.jquery.com/jquery-2.1.1.min'
      moment: '//cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min'
)

requirejs ['jquery'], ($) ->
  $ ->
    # routing
    $body = $('body')
    if $body.hasClass('page-index')
      requirejs ['home']
    else
      requirejs ['anchor']
