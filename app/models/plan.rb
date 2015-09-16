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
    @cumulus || begin
      cumulus = Plan.where(stripe_id: 'cumulus').first_or_initialize do |plan|
        plan.amount = 3000
        plan.interval = 'month'
        plan.name = 'Cumulus'
      end
      cumulus.save!(validate: false)
      cumulus
    end
  end

  def self.cumulus_no_trial
    @cumulus_no_trial || begin
      cumulus = Plan.where(stripe_id: 'cumulus_no_trial').first_or_initialize do |plan|
        plan.amount = 3000
        plan.interval = 'month'
        plan.name = 'Cumulus no trial'
      end
      cumlus.save!(validate: false)
      cumulus
    end
  end
end
