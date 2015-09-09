class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_pilot!
  before_action :set_locale
  before_action :redirect_to_payments_if_needed

  ## Locale

  def set_locale
    I18n.locale = current_pilot.try(:locale) || I18n.default_locale
  end

  ## Club

  def current_club
    current_pilot.try :club
  end

  def redirect_to_payments_if_needed
    redirect_to payments_path if force_payments_wizard?
  end

  def force_payments_wizard?
    true
  end

  ## Authorization

  def current_ability
    @current_ability ||= Ability.new(current_pilot)
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to error_403_path
  end
end
