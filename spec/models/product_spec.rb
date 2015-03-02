require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_with_invalid_url) { build(:product, image_url: 'lorem.jp') }
  let(:product) { build(:product) }

  it 'should contains valid image format' do
    expect(product_with_invalid_url).to_not be_valid
  end

  it 'should pass all validations' do
    expect(product).to be_valid
  end

  describe '.latest' do
    it 'returns most recently updated product' do
      first_product = create(:product, title: 'First')
      second_product = create(:product, title: 'Second')

      expect(Product.latest).to eq second_product
    end
  end
end
