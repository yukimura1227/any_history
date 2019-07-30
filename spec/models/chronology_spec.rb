require 'rails_helper'

RSpec.describe Chronology, type: :model do
  describe 'association' do
    describe 'belongs_to' do
      it { is_expected.to belong_to(:user).dependent(:destroy) }
    end
  end
end
