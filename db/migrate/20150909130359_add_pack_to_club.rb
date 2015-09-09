class AddPackToClub < ActiveRecord::Migration
  def change
    add_reference :clubs, :pack, index: true, foreign_key: true
  end
end
