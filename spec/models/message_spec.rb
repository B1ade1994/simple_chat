require 'rails_helper'

RSpec.describe Message do
  subject(:message) { build(:message) }

  context 'associations' do
    it { is_expected.to belong_to(:room) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
