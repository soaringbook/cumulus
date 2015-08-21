class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :short_name

      t.timestamps null: false
    end
  end
end
