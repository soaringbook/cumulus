class AddAvatarToGliders < ActiveRecord::Migration
  def change
    add_column :gliders, :avatar, :string
  end
end
