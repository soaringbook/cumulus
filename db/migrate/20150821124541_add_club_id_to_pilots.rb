class AddClubIdToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :club_id, :integer
  end
end
