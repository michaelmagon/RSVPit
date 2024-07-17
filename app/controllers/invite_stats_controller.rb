# frozen_string_literal: true

class InviteStatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_seats_invited = Guest.sum(:number_of_seats)
    @total_seats_attending = Guest.sum(:seats_attending)
  end

  private

  def authenticate_user!
    # basic auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USER'] &&
      password == ENV['ADMIN_PASSWORD']
    end
  end
end
