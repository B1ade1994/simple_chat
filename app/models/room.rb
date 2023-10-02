class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast(
      'rooms',
      RoomsController.render(partial: 'room', locals: { room: self })
    )
  end
end
