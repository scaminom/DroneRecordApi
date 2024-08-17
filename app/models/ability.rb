# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?
    can [:read], DroneData if user.user?
    can [:read], AcChargingStation if user.user?
    can [:read], DcChargingStation if user.user?
    can [:read], SolarPanel if user.user?
    can [:read], Drone if user.user?
  end
end
