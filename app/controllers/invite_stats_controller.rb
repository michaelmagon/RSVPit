# frozen_string_literal: true

class InviteStatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @total_seats_invited = Guest.sum(:number_of_seats)
    @total_seats_attending = Guest.sum(:seats_attending)
    @total_seats_not_attending = Guest.where(is_attending: 'not_attending').sum(:number_of_seats)

    @total_unasnwered_invitations = Guest.where(is_attending: 'undecided').count
    @total_unasnwered_invitations_locked = Guest.where(locked: true, is_attending: 'undecided').count
    @total_unasnwered_invitations_unlocked = Guest.where(locked: false, is_attending: 'undecided').count
  end

  def create
    @guests = Guest.where('created_at < ?', 1.week.ago)

    @guests.each do |guest|
      guest.update(locked: params[:state] == 'lock')
    end

    redirect_to invite_stats_path
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
