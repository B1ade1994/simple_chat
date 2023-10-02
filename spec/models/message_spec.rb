require 'rails_helper'

RSpec.describe Message do
  subject(:message) { build(:message) }

  context 'associations' do
    it { is_expected.to belong_to(:room) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  context 'callbacks' do
    describe 'create' do
      before do
        message.room.save!
        message.room_id = message.room.id
      end

      it 'broadcast_message' do
        expect { message.save! }.to have_broadcasted_to("messages:#{message.room_id}").from_channel(MessagesChannel)
      end
    end
  end
end
