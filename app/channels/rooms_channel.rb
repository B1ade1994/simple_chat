class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rooms'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
