$(function() {
  if($('#messages')[0]) {
    App.snippets = App.cable.subscriptions.create('MessagesChannel', {
      received: function(data) {
        return $('#messages').prepend(this.renderMessage(data));
      },
      renderMessage: function(data) {
        return "<li><div class='col s12 m2'><div class='z-depth-2 light-blue darken-3'><h3>" + data.app.name + ": </h3>Device ID: " + data.content + "<h5>" + data.device_id + "</h5></div></div></li>";
      }
    });
  }
});
