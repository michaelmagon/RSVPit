# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :guests
  belongs_to :user
end
