require 'rails_helper'

RSpec.describe Room do
  subject(:room) { build(:room) }

  # context 'associations' do
  #   it { should has_many(:messages) }
  # end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  context 'callbacks' do
    describe 'create' do
      it 'broadcast_message' do
        expect { room.save! }.to have_broadcasted_to('rooms').from_channel(RoomsChannel)
      end
    end
  end

  # context 'methods' do

  # end
end
