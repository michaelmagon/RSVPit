# frozen_string_literal: true

class Guest < ApplicationRecord

  after_save :create_slug

  def create_slug
    self.slug = "#{self.first_name[0]}#{self.last_name[0]}#{self.id}"
    self.save
  end
end
