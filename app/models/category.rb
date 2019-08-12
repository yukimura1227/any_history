# frozen_string_literal: true

# for Category
class Category < ApplicationRecord
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  belongs_to :chronology
  has_many :events, -> { order(:year, :month) }
end
