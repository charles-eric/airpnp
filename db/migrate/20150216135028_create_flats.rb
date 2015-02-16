class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :price
      t.string :description
      t.integer :capacity
      t.string :address
      t.string :city
      t.string :country
      t.references :user

      t.timestamps null: false
    end
  end
end
