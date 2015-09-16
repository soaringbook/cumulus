class AddClubToGliders < ActiveRecord::Migration
  def change
    add_column :gliders, :club_id, :integer

    add_index :gliders, :club_id
  end
end
