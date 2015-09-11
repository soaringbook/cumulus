class RenameColumnPackIdOnClubs < ActiveRecord::Migration
  def change
    rename_column :clubs, :pack_id, :plan_id
  end
end
