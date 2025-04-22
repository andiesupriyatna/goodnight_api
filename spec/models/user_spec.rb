require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'fields' do
    it { is_expected.to have_field(:name).of_type(String) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:sleep_history) }
    it { is_expected.to have_many(:following) }
    it { is_expected.to have_many(:followed_users) }
  end

  describe 'indexes' do
    it { is_expected.to have_index_for(name: 1) }
  end


end
