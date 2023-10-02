class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages:#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # stop_all_streams
    stop_stream_from "messages:#{params[:room_id]}"
  end
end
