require 'rails_helper'

RSpec.describe RoomsChannel do
  it 'subscribes to a rooms channel' do
    subscribe

    expect(subscription).to be_confirmed
  end
end
