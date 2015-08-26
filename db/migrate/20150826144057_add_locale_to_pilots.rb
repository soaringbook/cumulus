class AddLocaleToPilots < ActiveRecord::Migration
  def change
    add_column :pilots, :locale, :string, default: 'en', null: false
  end
end
