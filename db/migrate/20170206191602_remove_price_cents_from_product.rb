class RemovePriceCentsFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price_cents, :integer
  end
end
