---
---

define ['jquery', 'moment'], ($, moment) ->
  class Shuffler
    NUM_DIGITS: 13
    SHUFFLE_TIME: 1500 # ms

    constructor: ->
      @randomNumbers = @generateRandomNumbers(@NUM_DIGITS)
      @meetupDataPromise = @getMeetupData()

    render: ($el) ->
      @$dateMs = $el.find('#dateMs')
      @$dateStr = $el.find('#dateStr')
      @$date = @$dateMs.add(@$dateStr)

      @shuffle()
      @showStartTimeAfterDelay()

    shuffle: ->
      @updateRandomNumbers()
      @shuffleInterval = setInterval(@updateRandomNumbers.bind(@), 5)

    showStartTimeAfterDelay: ->
      setTimeout(@showStartTimeFromMeetup.bind(@), @SHUFFLE_TIME)

    getMeetupData: ->
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

    updateRandomNumbers: ->
      i = Math.floor(Math.random() * @NUM_DIGITS)
      @randomNumbers[i] = @getRand()
      randomStr = @randomNumbers.join('')
      @$date.text(randomStr)

    showStartTimeFromMeetup: ->
      @meetupDataPromise.then (data) =>
        result = data.results[0]
        @showStartTime(result.time)
        clearInterval(@shuffleInterval)

    showStartTime: (time) ->
      dateStr = moment(parseInt(time, 10)).format('ddd, MMMM Do YYYY, h:mm a')

      @$dateMs.text(time)
      @$dateStr.text(dateStr)

    getRand: ->
      Math.floor(Math.random() * 10)

    generateRandomNumbers: (n) ->
      @getRand() for i in [0..n]
