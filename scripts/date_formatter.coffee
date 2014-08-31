---
---

define ['moment'], (moment) ->
  (time) ->
    moment(time).format('ddd, MMMM Do YYYY, h:mm a')
