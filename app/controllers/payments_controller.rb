class PaymentsController < ApplicationController
  skip_before_action :redirect_to_payments_if_needed

  def show
    redirect_to edit_account_path if payment_completed?
  end
end
