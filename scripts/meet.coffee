---
---

define ['meetup', 'jquery', 'date_formatter'], (Meetup, $, formatDate) ->
  Meetup.getUpcomingRsvps().then (data) ->
    $ ->
      $list = $('.availability')
      $.each data.results, (i, rsvp) ->
          # TODO make configurable
          if rsvp.member.member_id is 8818215
            dateStr = formatDate(rsvp.event.time)
            $list.append("<li><a href=\"#{rsvp.event.event_url}\">#{dateStr}</a></li>")
