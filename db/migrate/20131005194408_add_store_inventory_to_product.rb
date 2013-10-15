class AddStoreInventoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :store_inventory, :string
  end
end
