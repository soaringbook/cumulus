class RemoveSubscriptionTypeFromClubs < ActiveRecord::Migration
  def change
    remove_column :clubs, :subscription_type
  end
end
