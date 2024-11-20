# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    @guest = Guest.find_by(slug: params[:id])
  end

  def update
    @guest = Guest.find_by(slug: params[:id])
    @guest_update = GuestUpdate.new(guest_params.merge(guest: @guest))
    @event = @guest.event


    if @guest_update.save
      event_name = "#{@event.name} update".parameterize.underscore.to_sym
      respond_to do |format|
        format.turbo_stream do
          render event_name, status: :ok
        end
      end
    else
      respond_to do |format|
        event_name = "#{@event.name} create".parameterize.underscore.to_sym
        format.turbo_stream do
          render event_name, status: :unprocessable_entity
        end
      end
    end

  end

  private

  def guest_params
    params.require(:guest).permit(:seats_attending, :is_attending, :phone_number)
  end
end
