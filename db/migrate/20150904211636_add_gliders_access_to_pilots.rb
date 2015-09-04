class AddGlidersAccessToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :gliders_access, :integer, default: 0, null: false
  end
end
