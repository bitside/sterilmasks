class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.string :street
      t.string :postal_code
      t.string :city

      t.timestamps
    end
  end
end
