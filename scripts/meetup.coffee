---
---

define ['jquery', 'jsonp'], ($) ->
  {
    KEY: '3c2a67534a193f12c46115f7b112e1e'

    getUpcomingMeetups: (count) ->
      # TODO replace after https://github.com/afeld/jsonp/pull/33 is merged
      params = $.param(
        key: @KEY
        sign: true
        group_urlname: 'hackerhours'
        page: count
      )

      $.jsonp(
        url: "http://api.meetup.com/2/events?#{params}"
        jsonpSupport: true
        cache: true
      )

    getUpcomingMeetupIds: ->
      @getUpcomingMeetups(10).then (data) ->
        results = data.results
        if results
          $.map data.results, (result) ->
            result.id
        else
          msg = JSON.stringify(data)
          throw new Error(data)

    getRsvps: (eventIds) ->
      $.ajax(
        url: 'http://api.meetup.com/2/rsvps'
        cache: true
        dataType: 'jsonp'
        data:
          key: @KEY
          sign: true
          rsvp: 'yes'
          event_id: eventIds.join(',')
          only: 'member,event'
      )

    getUpcomingRsvps: ->
      @getUpcomingMeetupIds().then (ids) =>
        @getRsvps(ids)
  }
