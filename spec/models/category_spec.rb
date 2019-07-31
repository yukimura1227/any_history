require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'association' do
    describe 'belongs_to chronology' do
      it { is_expected.to belong_to(:chronology) }
    end
    describe 'has_many events' do
      it { is_expected.to have_many(:events) }
    end
  end
end
