# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

pro1 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
).find_or_create_by!({
  name:  'Men\'s Classy shirt'
})

pro2 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
).find_or_create_by!({
  name:  'Women\'s Zebra pants'
})

pro3 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 4,
  price: 34.49
).find_or_create_by!({
  name:  'Hipster Hat'
})

pro4 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
).find_or_create_by!({
  name:  'Hipster Socks'
})

pro5 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 0,
  price: 1_225.00
).find_or_create_by!({
  name:  'Russian Spy Shoes'
})

pro6 = cat1.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
).find_or_create_by!({
  name:  'Human Feet Shoes'
})


pro7 = cat2.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
).find_or_create_by!({
  name:  'Modern Skateboards'
})

pro8 = cat2.products.create_with(description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
  ).find_or_create_by!({
  name:  'Hotdog Slicer'
})

pro9 = cat2.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
  ).find_or_create_by!({
  name:  'World\'s Largest Smartwatch'
})

pro10 = cat3.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
).find_or_create_by!({
  name:  'Optimal Sleeping Bed'
})

pro11 = cat3.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
).find_or_create_by!({
  name:  'Electric Chair'
})

pro12 = cat3.products.create_with(
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
).find_or_create_by!({
  name:  'Red Bookshelf'
})

# REVIEWS

puts "Re-creating Reviews ..."

Review.destroy_all

pro1.reviews.create!({
  description: 'Kinda Boring',
  rating: 6,
})

pro3.reviews.create!({
  description: 'Too hipster for me. Also uncomfortable af.',
  rating: 4
})

pro3.reviews.create!({
  description: 'Such marvelous hat.',
  rating: 8
})

pro5.reviews.create!({
  description: "Extremely useful spy shoes.",
  rating: 9
})

pro6.reviews.create!({
  description: 'Why would anyone buy this? Why did I buy this?',
  rating: 1
})

pro7.reviews.create!({
  description: 'I broke my ankle using these. They suck.',
  rating: 2
})

pro12.reviews.create!({
  description: "The best use of 3k in my life!",
  rating: 10
})

pro12.reviews.create!({
  description: 'I bought this when I was drunk. Now I have a useless 3k bookshelf.',
  rating: 2
})


puts "DONE!"
