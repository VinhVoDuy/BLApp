function track_ga_pageview() {
  if (typeof ga === 'function') {
    ga('set', 'location', location.pathname);
    ga('send', 'pageview');
  }
}

$(document).ready(track_ga_pageview);
$(document).on('turbolinks:load', track_ga_pageview);

