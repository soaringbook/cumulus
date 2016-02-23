class RemovePayola < ActiveRecord::Migration
  def change
    remove_foreign_key :clubs, :payola_subscriptions

    remove_column :clubs, :payola_subscription_id

    drop_table :plans
    drop_table :payola_affiliates
    drop_table :payola_sales
    drop_table :payola_coupons
    drop_table :payola_stripe_webhooks
    drop_table :payola_subscriptions
  end
end
