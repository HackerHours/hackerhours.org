$.get('http://jsonp.jit.su/?url=https%3A%2F%2Fapi.meetup.com%2F2%2Fevents%3Fkey%3D3c2a67534a193f12c46115f7b112e1e%26sign%3Dtrue%26group_urlname%3Dnyhacker%26page%3D3', function(data){
  var results = data.results;
  for (var i = 0; i < results.length; i++){
    var result = results[i];
    // find the first match
    if (result.name.match(/hacker hours/i)){
      // the document may or may not be ready
      $(function(){
        $('.meetupLink').attr('href', result.event_url);

        var dateStr = moment(parseInt(result.time, 10)).format('ddd, MMMM Do YYYY, h:mm a'),
          $meetupDate = $('#meetupDate');

        $meetupDate.find('#dateMs').text(result.time);
        $meetupDate.find('#dateStr').text(dateStr);
      });

      return;
    }
  }
});
