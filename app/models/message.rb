class Message < ApplicationRecord
  belongs_to :room

  validates :body, presence: true

  after_create_commit { broadcast_message }

  private

  def broadcast_message
    ActionCable.server.broadcast(
      "messages:#{room_id}",
      RoomsController.render(partial: '/messages/message', locals: { message: self })
    )
  end
end
