class Room < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast(
      'rooms',
      RoomsController.render(partial: 'table_row', locals: { room: self })
    )
  end
end
