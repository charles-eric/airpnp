class AddInfosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phonenumber, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :description, :string
  end
end
