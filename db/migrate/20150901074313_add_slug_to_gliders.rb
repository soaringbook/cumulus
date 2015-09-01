class AddSlugToGliders < ActiveRecord::Migration
  def change
    add_column :gliders, :slug, :string
    add_index :gliders, :slug, unique: true
  end
end
