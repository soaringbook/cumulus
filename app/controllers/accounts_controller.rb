class AccountsController < ApplicationController
  before_action :authorize_resource!

  def show
    redirect_to edit_account_path
  end

  def edit
    @club = current_club
    params['tab'] = 'status' unless params['tab']
  end

  def update
    @club = current_club
    if @club.update(update_params)
      redirect_to edit_account_path(tab: params['tab']), notice: t('pages.accounts.labels.notices.update')
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:club).permit(:short_name)
  end

  def authorize_resource!
    authorize! :update, current_club
  end
end
