class RoomsController < ApplicationController
  def index
    @room = Room.new

    @q = Room.ransack(params[:q])
    scope = @q.result
    _pagy, @rooms = pagy(scope)
  end

  def create
    @room = Room.new(resource_params)

    if @room.save
      redirect_to @room
    else
      render turbo_stream:
        turbo_stream.replace(
          'room_form',
          partial: 'form'
        )
    end
  end

  def show
    @room = Room.find(params[:id])

    @message = @room.messages.build
    @messages = @room.messages.reload
  end

  private

  def resource_params
    params.require(:room).permit(:title)
  end
end
