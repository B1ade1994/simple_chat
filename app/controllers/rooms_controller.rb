class RoomsController < ApplicationController
  def index
    scope = Room.all
    @room = Room.new
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
  end

  private

  def resource_params
    params.require(:room).permit(:title)
  end
end
