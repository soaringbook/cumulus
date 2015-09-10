class AddValidSubscriptionToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :subscription_type, :integer, default: 0, null: false
  end
end
