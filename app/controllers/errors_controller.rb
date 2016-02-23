class ErrorsController < ApplicationController
  skip_before_action :authenticate_pilot!

  layout 'error'

  def show
    @status_code = params[:code] || 500
    render status: @status_code
  end
end
