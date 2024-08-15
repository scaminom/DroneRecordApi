# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?
    can [:read], DatosUav if user.user?
    can [:read], EstacionCargaAc if user.user?
    can [:read], EstacionCargaDc if user.user?
    can [:read], PanelSolar if user.user?
    can [:read], Uav if user.user?
  end
end
