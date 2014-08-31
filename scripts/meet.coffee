---
---

define ['meetup'], (Meetup) ->
  Meetup.getUpcomingRsvps().then (data) ->
    $ ->
      $('.availability').text(JSON.stringify(data))
