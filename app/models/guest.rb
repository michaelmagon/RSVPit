# frozen_string_literal: true

class Guest < ApplicationRecord

  before_create :set_slug


  private

  def set_slug
    self.slug = generate_unique_slug
  end

  def generate_unique_slug
    loop do
      slug = generate_slug
      break slug unless self.class.exists?(slug: slug)
    end
  end

  def generate_slug
    "#{self.first_name[0]}#{self.last_name[0]}#{SecureRandom.hex(2)}"
  end
end
