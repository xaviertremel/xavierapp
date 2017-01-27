App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  var comment = data["comment"]["body"];
  $("#cable-notice").html("New comment: "+comment+"!").fadeIn(1000);
  $("#cable-notice").fadeOut(6000);
  }
});
