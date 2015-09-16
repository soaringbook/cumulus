class ErrorsController < ApplicationController
  skip_before_action :authenticate_pilot!
  skip_before_action :redirect_to_payments_if_needed

  layout 'error'

  def show
    @status_code = params[:code] || 500
    render status: @status_code
  end
end
