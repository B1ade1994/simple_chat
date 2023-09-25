class RoomsController < ApplicationController
  def index
    scope = Room.all
    @room = Room.new
    _pagy, @rooms = pagy(scope)
  end
end
