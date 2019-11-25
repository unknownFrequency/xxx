class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # Receives 'data' from channels/room.js speak function
  def speak(data)
    ActionCable.server.broadcast "room_channel", messsage: data['message']
  end
end
