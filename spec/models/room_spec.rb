require 'rails_helper'

RSpec.describe Room do
  subject { build(:room) }

  # context 'associations' do
  #   it { should has_many(:messages) }
  # end

  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  # context 'callbacks' do

  # end

  # context 'methods' do

  # end
end
