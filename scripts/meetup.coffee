---
---

define ['jquery', 'jsonp'], ($) ->
  {
    KEY: '3c2a67534a193f12c46115f7b112e1e'

    getUpcomingMeetups: (count) ->
      $.jsonp(
        url: 'http://api.meetup.com/2/events'
        jsonpSupport: true
        cache: true
        data:
          group_urlname: 'hackerhours'
          key: @KEY
          page: count
          sign: true
      )
  }
