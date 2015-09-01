class CreateGliders < ActiveRecord::Migration
  def change
    create_table :gliders do |t|
      t.string :immatriculation
      t.string :name
      t.boolean :double_seater,  default: false, null: false
      t.boolean :self_launching, default: false, null: false

      t.timestamps null: false
    end
  end
end
