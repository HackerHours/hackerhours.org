/*jshint browser:true, jquery:true */
/*global moment */
(function(){
  'use strict';
  var start = Date.now(),
    shuffler;

  $.when(
    $.getJSON('http://api.meetup.com/2/events?key=3c2a67534a193f12c46115f7b112e1e&sign=true&group_urlname=hackerhours&page=1&callback=?'),
    // https://github.com/jquery/api.jquery.com/pull/530
    $.ready
  ).then(function(data){
    var result = data[0].results[0];

    // ensure they've seen the animation for a minimum amount of time
    var elapsed = Date.now() - start,
      wait = 1500 - elapsed;

    if (wait < 0) wait = 0;
    setTimeout(function(){
      var dateStr = moment(parseInt(result.time, 10)).format('ddd, MMMM Do YYYY, h:mm a'),
        $meetupDate = $('#meetupDate');

      clearInterval(shuffler);
      $meetupDate.find('#dateMs').text(result.time);
      $meetupDate.find('#dateStr').text(dateStr);
    }, wait);
  });

  $(function(){
    var NUM_DIGITS = 13,
      $date = $('#dateMs,#dateStr'),
      currentTime = [];

    for (var i = 0; i < NUM_DIGITS; i++){
      currentTime[i] = Math.floor(Math.random() * 10);
    }

    $date.text(currentTime.join(''));

    shuffler = setInterval(function(){
      var i = Math.floor(Math.random() * NUM_DIGITS);
      currentTime[i] = Math.floor(Math.random() * 10);
      $date.text(currentTime.join(''));
    }, 5);
  });
}());
