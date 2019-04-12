class NotificationsChannel < ApplicationCable::Channel
  def subscribed

     stream_from current_user.email
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_notifications(data)
    @d = data['message'].split(",")
    ActionCable.server.broadcast @d[0], message:data['message']
  end 
end
