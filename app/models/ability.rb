# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :access, :rails_admin
    can :read, :dashboard

    if user.admin?
      can :manage, :all
    else
      can :manage, Guest, event: { user_id: user.id }
      can :manage, Event, user_id: user.id
      cannot :manage, User
      cannot :destroy, Event
    end
  end
end
