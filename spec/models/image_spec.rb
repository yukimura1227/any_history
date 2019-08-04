require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'association' do
    describe 'belongs_to user' do
      it { is_expected.to belong_to(:user) }
    end
  end
end
