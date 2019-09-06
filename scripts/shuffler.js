define(["meetup", "moment"], (Meetup, moment) => {
  class Shuffler {
    constructor() {
      this.NUM_DIGITS = 13;
      this.SHUFFLE_TIME = 1500; // ms

      this.randomNumbers = this.generateRandomNumbers(this.NUM_DIGITS);
      this.meetupDataPromise = Meetup.getUpcomingMeetups(1);
    }

    render($el) {
      this.$dateMs = $el.find("#dateMs");
      this.$dateStr = $el.find("#dateStr");
      this.$date = this.$dateMs.add(this.$dateStr);
      this.shuffle();
      this.showStartTimeAfterDelay();
    }

    shuffle() {
      this.updateRandomNumbers();
      this.shuffleInterval = setInterval(
        this.updateRandomNumbers.bind(this),
        5
      );
    }

    showStartTimeAfterDelay() {
      setTimeout(this.showStartTimeFromMeetup.bind(this), this.SHUFFLE_TIME);
    }

    updateRandomNumbers() {
      const i = Math.floor(Math.random() * this.NUM_DIGITS);
      this.randomNumbers[i] = this.getRand();
      const randomStr = this.randomNumbers.join("");
      this.$date.text(randomStr);
    }

    showStartTimeFromMeetup() {
      return this.meetupDataPromise.then(data => {
        const result = data.results[0];
        this.showStartTime(result.time);
        clearInterval(this.shuffleInterval);
      });
    }

    showStartTime(time) {
      const dateStr = moment(parseInt(time, 10)).format(
        "ddd, MMMM Do YYYY, h:mm a"
      );
      this.$dateMs.text(time);
      this.$dateStr.text(dateStr);
    }

    getRand() {
      return Math.floor(Math.random() * 10);
    }

    generateRandomNumbers(n) {
      return Array.from({ length: n }, () => this.getRand());
    }
  }

  return Shuffler;
});
