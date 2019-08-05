require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    describe 'has_many chronologies' do
      it { is_expected.to have_many(:chronologies) }
    end
    describe 'has_many authentications' do
      it { is_expected.to have_many(:authentications) }
    end
  end
end
