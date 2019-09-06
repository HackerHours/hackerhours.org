requirejs.config({
  paths: {
    URIjs: "https://cdn.rawgit.com/medialize/URI.js/v1.15.0/src",
    jquery: "https://code.jquery.com/jquery-2.1.1.min",
    jsonp: "https://cdn.rawgit.com/afeld/jsonp/v0.3.1/jsonp",
    moment: "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min"
  }
});

require(["jquery"], $ => {
  // routing
  if ($("html").hasClass("page-index")) {
    require(["home"]);
  } else {
    require(["anchor"]);
  }
});
