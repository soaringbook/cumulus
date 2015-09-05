class ProfilesController < ApplicationController
  def edit
    @pilot = current_pilot
  end

  def update
    @pilot = current_pilot
    if @pilot.update(update_params)
      sign_in @pilot, bypass: true
      redirect_to edit_profile_path, notice: t('pages.profiles.labels.notices.update')
    else
      render :edit
    end
  end

  private

  def update_params
    pilot_params = params
    if pilot_params[:pilot][:password].blank?
      pilot_params[:pilot].delete("password")
      pilot_params[:pilot].delete("password_confirmation")
    end
    pilot_params.require(:pilot).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar, :remove_avatar)
  end
end
