# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'nokogiri'
# url = "https://www.secrettelaviv.com/tickets/categories/environmental"

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# html_doc.search('post-content > tbody').each do |element|
#   # event = Event.new
#   puts element.attribute('href').value
#   puts element
#   # puts '************** ELEMENT HREF'
#   # puts element.attribute('href').value
#   # puts '************** ELEMENT SRC'
#   # puts element.attribute('src').value
# end
puts "destroying all events"
Event.destroy_all

puts "destroying all reports"
Report.destroy_all

puts "destroying all users"
User.destroy_all


puts "creating 3 users"
# user = User.create!(first_name: 'Ofir', last_name: 'Elboym', email: 'test@test.com', password: '123456')
# user2 = User.create!(first_name: 'Ben', last_name: 'Aronov', email: 'ben@test.com', password: '123456')
# TODO change this when we have user photo uploader for avatars !!!
user = User.create!(first_name: 'Elon', last_name: 'Musk', email: 'test@test.com', password: '123456', remote_photo_url: "https://pbs.twimg.com/profile_images/378800000305778238/852d2f76797dbe1da82095f988d38fbe_400x400.png" )
user2 = User.create!(first_name: 'Donald', last_name: 'Trump', email: 'trump@test.com', password: '123456', remote_photo_url: "https://pbs.twimg.com/profile_images/705575079258812420/cMMNr1UJ_400x400.jpg" )
user3 = User.create!(first_name: 'Lance', last_name: 'Armstrong', email: 'lance@test.com', password: '123456', remote_photo_url: "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2005/07/24/lanceafp128ready.jpg?width=300&quality=85&auto=format&fit=max&s=3a8b55f200e6466e3ad7a9a898d11172" )

EVENTNAMES = ["clean up the beach!", "coachellla", "Austin city limits", "tomorrowland", "doof", "Denim", "road side clean up", "Greenest Grass", "greta is comimg over", "Kappa 3"]
CATEGORIES = ["road block", "fire hazard", "pot hole", "water leak", "trash", "traffic light", "sewer leak"]
LOCATIONS = ["Ben yehuda 32, tel aviv", "arlozorov 7, tel aviv", "ben zion 25, tel aviv", "basel 10, tel aviv", "habima square, tel aviv", "gordon beach, tel aviv", "dizengoff 123, tel aviv", "alrozorov 17, tel aviv"]
EVENT_DESCRIPTION = ["help me!"]

PHOTOS =[
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/0404-X37-launch-Pentagon_mp1y1u.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/maxresdefault_jojkov.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/spacex-normandy-640x353_wh80wy.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869529/34c47267ea04098ea12a9b9731b2a51d_tkvbtg.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869529/spacex-crew-dragon-spaceship-nasa-commercial-crew-program-illustration-42878298755a9670c6596o_jqwfus.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869530/BFR-2018-spaceship-and-booster-sep-SpaceX-1c_dlkh3x.jpg"
]


puts "creating 5 reports"
15.times do
  Report.create!(
    user: user,
    description: EVENTNAMES.sample,
    location: LOCATIONS.sample,
    # remote_photo_url: PHOTOS.sample,
    upvote: 0,
    category: CATEGORIES.sample
    )
end

# puts "creating 5 reports for user2"
# 1.times do
#   Report.create!(
#     user: user2,
#     description: EVENTNAMES.sample,
#     location: LOCATIONS.sample,
#     # remote_photo_url: PHOTOS.sample,
#     upvote: 0,
#     category: CATEGORIES.sample
#     )
# end

puts "creating 5 events for user3"
1.times do
  Event.create!(
    description: EVENT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    name: EVENTNAMES.sample,
    date: Time.now,
    remote_photo_url: PHOTOS.sample,
    )
end

# puts "Making some bookings for user"

# ofirs_ships = Spaceship.where(user: user);

# 5.times do
#   Booking.create!(
#     user: user2,
#     spaceship: ofirs_ships.sample,
#     date: Date.today + ([0, 1, 10].sample)
#     )

# end

# 3.times do
#   Booking.create!(
#     user: user,
#     spaceship: ofirs_ships.sample,
#     date: Date.today + ([0, 2, 14].sample)
#     )

# end

  puts "finished seeding!"
