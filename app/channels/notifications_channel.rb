class NotificationsChannel < ApplicationCable::Channel
  def subscribed
     stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_notifications(data)
    ActionCable.server.broadcast "some_channel" , message:data['message']
  end
end
