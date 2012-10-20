$(function () {
  $('div#month-select a').live('click', function () {
    $.getScript(this.href);
    return false;
  });
})