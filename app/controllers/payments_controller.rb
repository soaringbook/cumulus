class PaymentsController < ApplicationController
  skip_before_action :redirect_to_payments_if_needed

  def show
    @plan = Plan.first
  end
end
