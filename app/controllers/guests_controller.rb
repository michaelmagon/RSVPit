# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    @guest = Guest.find_by(slug: params[:id])
  end

  def update
    @guest = Guest.find_by(slug: params[:id])
    @guest_update = GuestUpdate.new(guest_params.merge(guest: @guest))

    if @guest_update.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render :create, status: :unprocessable_entity
        end
      end
    end

  end

  private

  def guest_params
    params.require(:guest).permit(:seats_attending, :is_attending, :phone_number)
  end
end
