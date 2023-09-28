require 'rails_helper'

RSpec.describe 'Rooms' do
  describe 'GET /rooms' do
    it 'success' do
      get rooms_path
      expect(response).to be_successful
    end

    it 'list of all users' do
      room = create(:room)
      get rooms_path
      expect(response.body).to include(room.title)
    end
  end

  describe 'GET /rooms/:id' do
    let(:room) { create(:room) }

    it 'success' do
      get room_path(room)
      expect(response).to be_successful
    end
  end

  describe 'POST /rooms' do
    it 'creates a new room' do
      expect { post rooms_path, params: { room: { title: 'test' } } }.to change(Room, :count).by(1)
    end
  end
end
