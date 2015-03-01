class AddPrecisionToProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, precision: 5
  end
end
