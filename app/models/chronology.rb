# for Chronology
class Chronology < ApplicationRecord
  has_secure_token
  belongs_to :user
end
