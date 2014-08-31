---
---

define ['jquery'], ($) ->
  {
    KEY: '3c2a67534a193f12c46115f7b112e1e'

    getUpcomingMeetups: (count) ->
      $.ajax(
        url: 'http://api.meetup.com/2/events'
        cache: true
        dataType: 'jsonp'
        data:
          key: '3c2a67534a193f12c46115f7b112e1e'
          sign: true
          group_urlname: 'hackerhours'
          page: 1
      )
  }
