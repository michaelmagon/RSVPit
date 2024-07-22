# frozen_string_literal: true

class GuestUpdate
  include ActiveModel::Model
  include ActionView::Helpers::TextHelper

  attr_accessor :seats_attending, :is_attending, :guest, :phone_number

  validates :seats_attending, presence: true
  validates :is_attending, presence: true
  validates :guest, presence: true
  validate :seats_attending_cannot_be_greater_than_number_of_seats


  def save
    return false unless valid?

    guest.update(seats_attending: seats_attending, is_attending: is_attending, phone_number: phone_number)
  end


  private

  def seats_attending_cannot_be_greater_than_number_of_seats
    if seats_attending.to_i > guest.number_of_seats.to_i
      errors.add(:base, "Sorry, we only have #{pluralize(guest.number_of_seats, 'seat')} reserved for you.")
    end
  end
end
