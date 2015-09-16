class AddClubIdToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :club_id, :integer

    add_index :pilots, :club_id
  end
end
