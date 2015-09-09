class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.string :name
      t.string :stripe_id
      t.string :interval
      t.integer :amount

      t.timestamps null: false
    end
  end
end
