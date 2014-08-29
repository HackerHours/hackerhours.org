---
---

define ['jquery', 'shuffler'], ($, Shuffler) ->
  $dateRow = $('.dateRow')
  if $dateRow.length
    shuffler = new Shuffler
    $date = $dateRow.find('#meetupDate')
    shuffler.render($date)

    $dateRow.fadeIn()
