class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quanity
  end
end
