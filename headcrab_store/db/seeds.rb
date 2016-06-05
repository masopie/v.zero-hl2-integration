# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times {
  Headcrab.create!(name: Faker::Commerce.product_name, birthday: rand(1960..2016), price: rand(0...1)*10, description: Faker::Hipster.paragraph, pic_url: "http://images.akamai.steamusercontent.com/ugc/32967403439570703/D2ED5B46E8814DF49532A22940B851642EC8279A/")
}
