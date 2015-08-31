class AddClubToGliders < ActiveRecord::Migration
  def change
    add_column :gliders, :club_id, :integer
  end
end
