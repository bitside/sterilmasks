class AddConfirmableToConsumers < ActiveRecord::Migration[6.0]
  def change
    add_column :consumers, :confirmation_token, :string
    add_column :consumers, :confirmed_at, :datetime

    add_index :consumers, :confirmation_token, unique: true
    add_index :consumers, :confirmed_at
  end
end
