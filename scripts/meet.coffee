---
---

define ['meetup', 'jquery', 'underscore', 'moment'], (Meetup, $, _, Moment) ->
  Meetup.getUpcomingRsvps().then (data) ->
    $ ->
      $list = $('.availability')
      _.each data.results, (rsvp) ->
          # TODO make configurable
          if rsvp.member.member_id is 8818215
            # TODO combine with homepage code
            dateStr = moment(parseInt(rsvp.event.time, 10)).format('ddd, MMMM Do YYYY, h:mm a')
            $list.append("<li><a href=\"#{rsvp.event.event_url}\">#{dateStr}</a></li>")
