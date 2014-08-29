---
---

requirejs.config(
    paths:
      jquery: '//code.jquery.com/jquery-2.1.1.min'
      moment: '//cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min'
)

requirejs ['jquery', 'shuffler'], ($, Shuffler) ->
  $ ->
    $el = $('#meetupDate')
    if $el.length
      shuffler = new Shuffler
      shuffler.render($el)
