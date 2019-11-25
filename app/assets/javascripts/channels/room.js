App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    alert(data['message'])
  }

  // This will send a message object serialized as JSON to the server-side speak method in the RoomChannel.
  speak: function(message) {
    return this.perform('speak', {message});
  }

});

  // $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  //   if (event.keyCode === 13) { // return/enter = send
  //     App.room.speak(event.target.value);
  //     event.target.value = '';
  //     return event.preventDefault();
  //   }
  // })
