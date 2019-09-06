define(["jquery", "shuffler"], ($, Shuffler) => {
  const shuffler = new Shuffler();
  $(() => {
    const $dateRow = $(".dateRow");
    const $date = $dateRow.find("#meetupDate");
    shuffler.render($date);
    $dateRow.fadeTo(300, 1);
  });
});
