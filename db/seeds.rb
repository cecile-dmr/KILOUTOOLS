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

Booking.destroy_all
puts "Cleaning bookings..."
Tool.destroy_all
puts "Cleaning tools..."
User.destroy_all
puts "Cleaning users..."


theo = User.create!(email: "theo@mail.com", password: "hellohello")
cecile = User.create!(email: "cecile@mail.com", password: "hellohello")
baptiste = User.create!(email: "baptiste@mail.com", password: "hellohello")
aldjia = User.create!(email: "aldjia@mail.com", password: "hellohello")
p theo
p cecile
p baptiste
p aldjia

test = '../app/assets/images/marteau.jpg'

tool = Tool.new(name: "Marteau", price: 15, description: "Cet outil est en parfait état, comme neuf, prêt à l’emploi.", address: "Lille", user: aldjia)
filepath = Rails.root.join('app/assets/images/marteau.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "marteau.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Pince", price: "10", description: "Légeres traces d’utilisation, mais fonctionne parfaitement.", address: "Lille", user: aldjia)
filepath = Rails.root.join('app/assets/images/pince.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "pince.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Scie-sauteuse", price: "20", description: "Présente des signes d’usage régulier, mais totalement fonctionnel.", address: "Lomme", user: cecile)
filepath = Rails.root.join('app/assets/images/scie_sauteuse.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "scie_sauteuse.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Echelle", price: "50", description: "Échelle en aluminium, légère et résistante pour tous vos travaux.", address: "Boulogne", user: cecile)
filepath = Rails.root.join('app/assets/images/echelle.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "echelle.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Perceuse", price: "20", description: "Aucun signe d’usure, elle fonctionne impeccablement.", address: "Lambersart", user: cecile)
filepath = Rails.root.join('app/assets/images/perceuse.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "perceuse.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Lot de perceuses", price: "35", description: "Perceuses sans fil, idéales pour tous vos travaux de bricolage.", address: "Amiens", user: aldjia)
filepath = Rails.root.join('app/assets/images/Lot_de_perceuse.jpeg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "Lot_de_perceuse.jpeg", content_type: "image/jpeg")
tool.save
p tool

tool = Tool.new(name: "Perceuse", price: "10", description: "Perceuse filaire puissante, parfaite pour un usage intensif.", address: "Hem", user: aldjia)
filepath = Rails.root.join('app/assets/images/perceuse2.jpeg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "perceuse2.jpeg", content_type: "image/jpeg")
tool.save
p tool

tool = Tool.new(name: "Echelle en alu", price: "25", description: "Échelle en aluminium, légère et résistante pour tous vos travaux.", address: "Hem", user: aldjia)
filepath = Rails.root.join('app/assets/images/echelle2.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "echelle2.jpg", content_type: "image/jpg")
tool.save

tool = Tool.new(name: "Perceuse", price: "40", description: "Perceuse magnétique, fixation sécurisée pour un perçage précis du métal.", address: "Valenciennes", user: theo)
filepath = Rails.root.join('app/assets/images/perceuse3.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "perceuse3.jpg", content_type: "image/jpg")
tool.save
p tool

tool = Tool.new(name: "Perceuse", price: "8", description: "Perceuse à vitesse variable, s’adapte à tous vos besoins.", address: "Dunkerque", user: aldjia)
filepath = Rails.root.join('app/assets/images/perceuse4.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "perceuse4.jpg", content_type: "image/jpg")
tool.save
p tool

tool = Tool.new(name: "Echelle en alu", price: "20", description: "Échelle coulissante, idéale pour atteindre de grandes hauteurs.", address: "Lille", user: aldjia)
filepath = Rails.root.join('app/assets/images/echelle3.jpeg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "echelle3.jpeg", content_type: "image/jpeg")
tool.save

tool = Tool.new(name: "Perceuse", price: "16", description: "Perceuse pneumatique, légère et performante pour les pros.", address: "Calais", user: cecile)
filepath = Rails.root.join('app/assets/images/perceuse5.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "perceuse5.jpg", content_type: "image/jpg")
tool.save
p tool

tool = Tool.new(name: "Scie-sauteuse", price: "40", description: "Scie circulaire puissante, parfaite pour des coupes nettes et précises.", address: "Fort-Mahon", user: cecile)
filepath = Rails.root.join('app/assets/images/scie_sauteuse2.jpg')
file = File.open(filepath)
tool.photo.attach(io: file, filename: "scie_sauteuse2.jpg", content_type: "image/jpg")
tool.save
p tool

# Tool.create!(name: "Marteau", price: 15, description: "Cet outil est en parfait état, comme neuf, prêt à l’emploi.", address: "Lille", photo: url(test), user: cecile)
# Tool.create(name: "Pince", price: "10", description: "Légeres traces d’utilisation, mais fonctionne parfaitement.", address: "Lille", photo: "pince.jpg", user: cecile)
# Tool.create(name: "Scie-sauteuse", price: "20", description: "Présente des signes d’usage régulier, mais totalement fonctionnel.", address: "Lomme", photo: "scie_sauteuse.jpg", user: baptiste)
# Tool.create(name: "Perceuse", price: "20", description: "Aucun signe d’usure, elle fonctionne impeccablement.", address: "Lambersart", photo: "perceuse.jpg", user: aldjia)

puts "Finished! Created #{Tool.count} tools."

# User.all.each do |user|

#   5.times do
#     puts "Creating tools..."
#     tool = Tool.new(
#       name: names.sample,
#       price: Faker::Commerce.price,
#       description: Faker::Lorem.paragraph(sentence_count: 3),
#       address: addresss.sample,
#       photo: "https://loremflickr.com/400/300/tools",
#       user: user
#     )
#     tool.save!
#     puts "Created #{tool.name}"
#   end

# end

# 10.times do
#   puts "Creating users..."
#   user = User.new(
#     email: Faker::Internet.email,
#     password: Faker::Internet.password
#   )
#   user.save!
#   puts "Created #{user.email}"
# end
# puts "Finished! Created #{User.count} users."

# names = ["perceuse", "tournevis", "marteau", "échelle"]
# addresss = ["Lille", "Lomme", "Lambersart", "Wambrechies", "Wasquehal"]

# 25.times do
#   puts "Creating tools..."
#   tool = Tool.new(
#     name: names.sample,
#     price: Faker::Commerce.price,
#     description: Faker::Lorem.paragraph(sentence_count: 3),
#     address: addresss.sample,
#     photo: "https://loremflickr.com/400/300/tools",
#     user: User.find(rand(User.first.id..User.last.id))
#   )
#   tool.save!
#   puts "Created #{tool.name}"
# end
# puts "Finished! Created #{Tool.count} tools."


statuses = ["En attente", "Acceptée", "Déclinée"]

10.times do
  puts "Creating bookings..."
  booking = Booking.new(
    user_id: User.all.ids.sample,
    tool_id: Tool.all.ids.sample,
    start_date: Faker::Date.between(from: '2025-03-04', to: '2025-03-15'),
    end_date: Faker::Date.between(from: '2025-03-16', to: '2025-03-30'),
    status: statuses.sample
  )
  booking.save!
end
# 5.times do
#   puts "Creating bookings..."
#   booking = Booking.new(
#     user: theo,
#     tool_id: Tool.all.ids.sample,
#     start_date: Faker::Date.between(from: '2025-03-04', to: '2025-03-15'),
#     end_date: Faker::Date.between(from: '2025-03-16', to: '2025-03-30'),
#     status: statuses.sample
#   )
#   booking.save!
# end

# 5.times do
#   puts "Creating bookings..."
#   booking = Booking.new(
#     user_id: User.all.ids.sample,
#     tool_id: Tool.all.first.id,
#     start_date: Faker::Date.between(from: '2025-03-04', to: '2025-03-15'),
#     end_date: Faker::Date.between(from: '2025-03-16', to: '2025-03-30'),
#     status: statuses.sample
#   )
#   booking.save!
# end
puts "Finished! Created #{Booking.count} booking."
