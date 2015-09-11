class AddSubscriptionIdToClubs < ActiveRecord::Migration
  def change
    add_reference :clubs, :payola_subscription, index: true, foreign_key: true
  end
end
