require 'rails_helper'

RSpec.describe Chronology, type: :model do
  describe 'association' do
    describe 'belongs_to user' do
      it { is_expected.to belong_to(:user) }
    end
    describe 'has_many categories' do
      it { is_expected.to have_many(:categories).dependent(:destroy) }
    end
  end
end
