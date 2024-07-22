# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    @guest = Guest.find_by(slug: params[:id])
  end

  def update
    @guest = Guest.find_by(slug: params[:id])
    @guest.update(guest_params)

    respond_to do |format|
      format.turbo_stream
    end

  end

  private

  def guest_params
    params.require(:guest).permit(:seats_attending, :is_attending)
  end
end
