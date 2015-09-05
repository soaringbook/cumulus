class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_pilot!
  before_action :set_locale

  ## Locale

  def set_locale
    I18n.locale = current_pilot.try(:locale) || I18n.default_locale
  end

  ## Club

  def current_club
    current_pilot.try :club
  end

  ## Authorization

  def current_ability
    @current_ability ||= Ability.new(current_pilot)
  end
end
