---
---

define ['jquery', 'shuffler'], ($, Shuffler) ->
  shuffler = new Shuffler

  $ ->
    $dateRow = $('.dateRow')
    $date = $dateRow.find('#meetupDate')
    shuffler.render($date)

    $dateRow.fadeIn()
