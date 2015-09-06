class ProfilesController < ApplicationController
  def edit
    @pilot = current_pilot
    params['tab'] = 'profile' unless params['tab']
  end

  def update
    @pilot = current_pilot
    if @pilot.update(update_params)
      sign_in @pilot, bypass: true
      redirect_to edit_profile_path(tab: params['tab']), notice: t('pages.profiles.labels.notices.update')
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:pilot).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar, :remove_avatar, :locale)
  end
end
