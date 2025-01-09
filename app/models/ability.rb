# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    if user.present?
      if user.admin?
        # Admin can manage everything
        can :manage, :all
      elsif user.operator?
        # Define abilities for operators
        can :read, Centre
        can :read, Donor
        can :create, DonorScreening
        can :update, DonorScreening
        can :create, DonorPhysicalExam
        can :update, DonorPhysicalExam

        # Allow specific actions like accessing donor details
        can :view_donor_details, Donor
      else
        # Default abilities for a logged-in user (e.g., donors or others)
        can :read, Question
      end
    else
      # Abilities for guests (not logged in)
      can :read, Question
    end
  end
end
