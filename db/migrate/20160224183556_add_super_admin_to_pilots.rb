class AddSuperAdminToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :super_admin, :boolean, default: false, null: false
  end
end
