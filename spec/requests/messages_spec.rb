require 'rails_helper'

RSpec.describe 'Messages' do
  let(:room) { create(:room) }

  describe 'POST /rooms/:room_id/messages' do
    it 'creates a new message' do
      expect { post room_messages_path(room), params: { message: { body: 'hello' } } }.to change(Message, :count).by(1)
    end
  end
end
