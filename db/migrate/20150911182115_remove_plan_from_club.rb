class RemovePlanFromClub < ActiveRecord::Migration
  def change
    remove_column :clubs, :plan_id
  end
end
