FactoryGirl.define do
  factory :product do
    title 'Lorem Ipsum'
    description 'Wibbles are fun!'
    image_url 'lorem.jpg'
    price 19.95
  end

  factory :invalid_product, parent: :product do |f|
    f.title nil
  end
end
