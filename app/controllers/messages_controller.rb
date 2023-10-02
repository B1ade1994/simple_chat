class MessagesController < ApplicationController
  before_action :load_room

  def create
    @message = @room.messages.build(resource_params)
    @message.save!
  end

  private

  def resource_params
    params.require(:message).permit(:body)
  end

  def load_room
    @room = Room.find(params[:room_id])
  end
end
