class AddPilotAccessToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :pilot_access, :integer, default: 0, null: false
  end
end
