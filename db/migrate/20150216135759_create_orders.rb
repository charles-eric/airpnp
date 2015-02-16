class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date_begin
      t.date :date_end
      t.boolean :booked
      t.references :user
      t.references :flat

      t.timestamps null: false
    end
  end
end
