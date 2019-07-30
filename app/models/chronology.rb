# for Chronology
class Chronology < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
