class RemoveAcceptedFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :accepted, :boolean
  end
end
