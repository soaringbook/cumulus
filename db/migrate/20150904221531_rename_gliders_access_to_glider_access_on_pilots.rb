class RenameGlidersAccessToGliderAccessOnPilots < ActiveRecord::Migration
  def change
    change_table :pilots do |t|
      t.rename :gliders_access, :glider_access
    end
  end
end
