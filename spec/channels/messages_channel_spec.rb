require 'rails_helper'

RSpec.describe MessagesChannel do
  let(:room) { create(:room) }

  it 'subscribes to a rooms channel' do
    subscribe(room_id: room.id)

    expect(subscription).to be_confirmed
  end
end
