class AddServicesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :services, :string
  end
end
