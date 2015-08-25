class ErrorsController < ApplicationController
  skip_before_filter :authenticate_pilot!

  layout 'error'

  def show
  end
end
