class Club < ActiveRecord::Base
  belongs_to :plan
  belongs_to :subscription, class_name: 'Payola::Subscription', foreign_key: 'payola_subscription_id'

  has_many :pilots,  dependent: :destroy
  has_many :gliders, dependent: :destroy

  validates :short_name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates_associated :plan
end
