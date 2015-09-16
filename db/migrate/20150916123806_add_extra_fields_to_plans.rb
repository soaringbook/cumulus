class AddExtraFieldsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :currency, :string
    add_column :plans, :trial_period_days, :integer
  end
end
