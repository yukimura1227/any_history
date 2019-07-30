# for Chronology
class Chronology < ApplicationRecord
  has_secure_token
  belongs_to :user
  has_many :categories, dependent: :destroy
end
