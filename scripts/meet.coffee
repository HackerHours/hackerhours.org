---
---

define ['meetup', 'jquery', 'date_formatter'], (Meetup, $, formatDate) ->
  getMemberId = ->
    window.location.hash.slice(1) || undefined

  displayEvent = (rsvp) ->
    dateStr = formatDate(rsvp.event.time)
    $('.availability').append("<li><a href=\"#{rsvp.event.event_url}\">#{dateStr}</a></li>")

  displayEvents = (rsvps) ->
    memberIdStr = getMemberId()
    $.each rsvps, (i, rsvp) ->
      if rsvp.member.member_id.toString() is memberIdStr
        displayEvent(rsvp)

  displayMeetPage = ->
    if getMemberId()
      Meetup.getUpcomingRsvps().then (data) ->
        $ ->
          if data.results.length
            displayEvents(data.results)
          else
            $('.alert').text("No upcoming availability, sorry!")
    else
      $ ->
        $('.alert').html("Please include a Meetup member ID as the page hash. For example: <a href=\"#8818215\">Aidan Feldman</a>.")


  displayMeetPage()
  $(window).on 'hashchange', displayMeetPage
