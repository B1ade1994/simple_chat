class Message < ApplicationRecord
  belongs_to :room

  validates :body, presence: true
end
