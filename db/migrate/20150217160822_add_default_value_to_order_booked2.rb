class AddDefaultValueToOrderBooked2 < ActiveRecord::Migration
  def up
    change_column :orders, :booked, :boolean, default: false
end

  def down
    change_column :orders, :booked, :boolean, default: true
  end
end
