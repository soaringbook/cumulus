class Plan < ActiveRecord::Base
  include Payola::Plan

  has_many :clubs
  has_many :subscriptions, class_name: 'Payola::Subscription', dependent: :destroy

  def redirect_path(_subscription)
    routes = Rails.application.routes.url_helpers
    routes.edit_account_path
  end

  ### Amounts

  def decimal_amount
    BigDecimal.new(amount) / 100.0
  end

  ### Plans

  def self.cumulus
    Plan.where(stripe_id: 'cumulus').first
  end
end
