# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    @guest = Guest.find_by(slug: params[:id])
  end
end
