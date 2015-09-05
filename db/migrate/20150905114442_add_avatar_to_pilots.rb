class AddAvatarToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :avatar, :string
  end
end
