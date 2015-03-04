class CombineItemsInCart < ActiveRecord::Migration
  def up
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quanity)

      sums.each do |product_id, quanity|
        if quanity > 1
          cart.line_items.where(product_id: product_id).delete_all
          item = cart.line_items.build(product_id: product_id)
          item.quanity = quanity
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quanity>1").each do |line_item|
      line_item.quanity.times do
        LineItem.create cart_id: line_item.cart_id,
          product_id: line_item.product_id, quanity: 1
      end

      line_item.destroy
    end
  end
end
