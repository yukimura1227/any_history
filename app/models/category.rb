# frozen_string_literal: true

# for Category
class Category < ApplicationRecord
  belongs_to :chronology
  has_many :events, -> { order(:year, :month) }
end
