class AddConfirmationToPilots < ActiveRecord::Migration
  def self.up
    add_column :pilots, :confirmation_token, :string
    add_column :pilots, :confirmed_at, :datetime
    add_column :pilots, :confirmation_sent_at, :datetime
    add_index :pilots, :confirmation_token, :unique => true
  end

  def self.down
    remove_column :pilots, [:confirmed_at, :confirmation_token, :confirmation_sent_at]
  end
end
