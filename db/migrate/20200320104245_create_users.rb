class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.string :street
      t.string :postal_code
      t.string :city

      t.timestamps
    end

      add_index :users, :type
  end
end
