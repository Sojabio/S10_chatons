# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Order.destroy_all
CartItem.destroy_all
Item.destroy_all
Cart.destroy_all
User.destroy_all

User.create!(
  name: "Chadmin",
  email: "chadmin@admin.fr",
  password: "password",
  is_admin: true
)

5.times do
  User.create!(
    name: Faker::Name.first_name,
    email: Faker::Internet.unique.email,
    password: "123456")
end

7.times do
  Cart.create!(
    user_id: rand(User.first.id..User.last.id)
  )
end

array_url_photos = ["app/assets/images/cat.png"]
# "app/assets/images/cat_dalle_1.png","app/assets/images/cat_dalle_2.png",

array_name_photos = ["cat_dalle_1.png","cat_dalle_2.png","cat_dalle_3.png","cat_dalle_4.png", "cat.png"]

10.times do
  i = Item.create!(
    title: Faker::Commerce.product_name.truncate(23),
    description: Faker::Lorem.sentence,
    price: rand(1..100),
    image_url: array_name_photos.sample
  )

  i.photo.attach(io: File.open(File.join(Rails.root, "app/assets/images/#{i.image_url}")), filename: i.image_url)

end

6.times do
  CartItem.create!(
    item_id: rand(Item.first.id..Item.last.id),
    cart_id: rand(Cart.first.id..Cart.last.id)
  )
end

10.times do
  check = 1
  while (check ==1)
    cart_id= rand(Cart.first.id..Cart.last.id)
    if Cart.find(cart_id).cart_items.size != 0
      check = 0
    end
  end
end
