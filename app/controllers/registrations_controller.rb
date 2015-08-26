class RegistrationsController < Devise::RegistrationsController
  protected

  def build_resource(hash = nil)
    super
    resource.build_club unless resource.club
  end

  def sign_up_params
    params.require(:pilot).permit(:email, :password, :password_confirmation, club_attributes: [:short_name])
  end
end
