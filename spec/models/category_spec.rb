require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'association' do
    describe 'belongs_to' do
      it { is_expected.to belong_to(:chronology) }
    end
  end
end
