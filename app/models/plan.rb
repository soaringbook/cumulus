class Plan < ActiveRecord::Base
  include Payola::Plan

  has_many :clubs
  has_many :subscriptions, class_name: 'Payola::Subscription', dependent: :destroy

  validates :stripe_id, inclusion: { in: Plan.pluck('DISTINCT stripe_id'), message: 'not a valid subscription plan' }

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
    Plan.find_by(stripe_id: 'cumulus')
  end

  def self.cumulus_no_trial
    Plan.find_by(stripe_id: 'cumulus_no_trial')
  end
end
