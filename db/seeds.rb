Product.delete_all

Product.create!(title: 'Programming Ruby',
                description: %{<p>Ruby book</p>},
                image_url: 'ruby.jpg', 
                price: 49.95)

Product.create!(title: 'CoffeeScript',
                description: %{<p>Coffee is awesome</p>},
                image_url: 'cs.jpg',
                price: 36.00)

Product.create!(title: 'Rails Test',
                description: %{<p>U should write Rails tests</p>},
                image_url: 'rtp.jpg',
                price: 34.95)


