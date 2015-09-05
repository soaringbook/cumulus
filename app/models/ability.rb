class Ability
  include CanCan::Ability

  def initialize(pilot)
    pilot ||= Pilot.new
  end

  private

  def allow_write_access! pilot, model_class, list
    can :manage, model_class, pilot.club.public_send(list) do |item|
      true
    end
  end
end
