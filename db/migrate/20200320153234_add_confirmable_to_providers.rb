class AddConfirmableToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :confirmation_token, :string
    add_column :providers, :confirmed_at, :datetime

    add_index :providers, :confirmation_token, unique: true
    add_index :providers, :confirmed_at
  end
end
