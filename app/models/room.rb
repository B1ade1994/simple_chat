class Room < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  after_create_commit { broadcast_message }

  def self.ransackable_attributes(_auth_object = nil)
    column_names
  end

  private

  def broadcast_message
    ActionCable.server.broadcast(
      'rooms',
      RoomsController.render(partial: 'room', locals: { room: self })
    )
  end
end
