class AddActiveDateToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :active_until, :date
  end
end
