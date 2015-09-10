class Pack < ActiveRecord::Base
  include Payola::Plan

  has_many :clubs

  validates :stripe_id, inclusion: { in: Pack.pluck('DISTINCT stripe_id'), message: "not a valid subscription plan" }

  def redirect_path(subscription)
    '/'
  end

  ### Amounts

  def decimal_amount
    BigDecimal.new(amount) / 100.0
  end
end
