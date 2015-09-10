class AccountsController < ApplicationController
  before_action :authorize_resource!

  def show
    redirect_to edit_account_path
  end

  def edit
    @subscription = Payola::Subscription.find_by!(owner_id: current_club.id, state: 'active')
    params['tab'] = 'payment' unless params['tab']
  end

  private

  def authorize_resource!
    authorize! :update, current_club
  end
end
