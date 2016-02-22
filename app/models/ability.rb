class Ability
  include CanCan::Ability

  def initialize(pilot)
    pilot ||= Pilot.new

    allow_resource_access! pilot, :gliders
    allow_resource_access! pilot, :pilots

    allow_admin_access! pilot, :club
  end

  private

  def allow_admin_access!(pilot, resource)
    return unless pilot.admin?
    can :manage, pilot.public_send(resource) do |_item|
      true
    end
  end

  def allow_resource_access!(pilot, resources)
    if pilot.admin? || pilot.public_send("#{resources}_writable?")
      allow_access! pilot, :manage, resources
    elsif pilot.public_send("#{resources}_readable?")
      allow_access! pilot, :read, resources
    end
  end

  def allow_access!(pilot, access_type, resources)
    model_class = pilot.club.association(resources).reflection.class_name.constantize
    can access_type, model_class, pilot.club.public_send(resources) do |_item|
      true
    end
  end
end
