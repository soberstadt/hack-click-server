$(function() {
  if($('#messages')[0]) {
    var darkness = 6;
    App.snippets = App.cable.subscriptions.create('MessagesChannel', {
      received: function(data) {
        return $('#messages').prepend(this.renderMessage(data));
      },
      renderMessage: function(data) {
        darkness -= 1;
        if(darkness == 2)
          darkness = 5;
        return "<li><div class='col s12 m2'><div class='z-depth-2 light-blue darken-" + darkness + "'><h3>" + data.app.name + ": </h3>" + data.content + "<h5>Device ID: " + data.device_id + "</h5></div></div></li>";
      }
    });
  }
});
