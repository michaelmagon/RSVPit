# frozen_string_literal: true

class Guest < ApplicationRecord

  before_create :set_slug

  enum is_attending: {
    undecided: 'undecided',
    attending: 'attending',
    not_attending: 'not_attending'
  }

  def already_answered?
    is_attending == 'attending' || is_attending == 'not_attending'
  end

  def attending?
    is_attending == 'attending'
  end

  def not_attending?
    is_attending == 'not_attending'
  end

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
