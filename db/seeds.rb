# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require "faker"

puts "Cleaning database..."
Tool.destroy_all
puts "Cleaning database..."
User.destroy_all

5.times do
  puts "Creating users..."
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  puts "Created #{user.email}"
end
puts "Finished! Created #{User.count} users."

25.times do
  puts "Creating tools..."
  tool = Tool.new(
    name: Faker::Games::Minecraft.item,
    price: Faker::Commerce.price,
    description: Faker::Commerce.product_name,
    localisation: Faker::Address.city,
    photo: Faker::Placeholdit.image(size: '50x50', format: 'jpg'),
    user: User.first
  )
  tool.save!
  puts "Created #{tool.name}"
end
puts "Finished! Created #{Tool.count} tools."
