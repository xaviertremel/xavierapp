class RenamePriceColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :price, :price_cents
  end
end
