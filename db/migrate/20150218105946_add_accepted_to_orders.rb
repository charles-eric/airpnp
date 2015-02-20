class AddAcceptedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :accepted, :boolean, default: nil
  end
end
