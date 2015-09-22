class AddFieldsToGliders < ActiveRecord::Migration
  def change
    add_column :gliders, :external, :bool, default: false

    create_table :gliders_pilots do |t|
      t.integer :pilot_id
      t.integer :glider_id
    end
  end
end
