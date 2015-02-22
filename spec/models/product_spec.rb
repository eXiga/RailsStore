require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product_with_invalid_url) { build(:product, image_url: 'lorem.jp') }

  it 'should contains valid image format' do
    expect(product_with_invalid_url).to_not be_valid
  end
end
