require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'association' do
    describe 'belongs_to chronology' do
      it { is_expected.to belong_to(:chronology) }
    end
    describe 'belongs_to category' do
      it { is_expected.to belong_to(:category) }
    end
    describe 'belongs_to image' do
      it { is_expected.to belong_to(:image) }
    end
  end
end
