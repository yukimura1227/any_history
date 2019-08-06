# frozen_string_literal: true

# class for event
class Event < ApplicationRecord
  belongs_to :chronology
  belongs_to :category
  belongs_to :image, optional: true
end
