class Plan < ActiveRecord::Base
  include Payola::Plan

  has_many :clubs
  has_many :subscriptions, class_name: "Payola::Subscription", dependent: :destroy

  validates :stripe_id, inclusion: { in: Plan.pluck('DISTINCT stripe_id'), message: "not a valid subscription plan" }

  def redirect_path(subscription)
    routes = Rails.application.routes.url_helpers
    routes.root_path
  end

  ### Amounts

  def decimal_amount
    BigDecimal.new(amount) / 100.0
  end


  ### Types

  def basic?
    stripe_id == 'basic'
  end

  def extended?
    stripe_id == 'extended'
  end

  def full?
    stripe_id == 'full'
  end
end
