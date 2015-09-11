class RenamePackToPlan < ActiveRecord::Migration
  def change
    rename_table :packs, :plans
  end
end
