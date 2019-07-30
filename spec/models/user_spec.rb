require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    describe 'has_many' do
      it { is_expected.to have_many(:chronologies) }
    end
  end
end
