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
alon = User.create!(first_name: 'alon', last_name: 'shvartsman', email: 'alon@shvartsman.com', password: '123456')
noah = User.create!(first_name: 'noah', last_name: 'schlesinger', email: 'noah@schlesinger.com', password: '123456')
ofir = User.create!(first_name: 'ofir', last_name: 'Elboym', email: 'ofir@elboym.com', password: '123456')
omri = User.create!(first_name: 'omri', last_name: 'shabtay', email: 'omri@shabtay.com', password: '123456')

EVENTNAMES = ["Clean up the beach!", "Road side clean up!", "Climate change protest", "Save the turtles!", "Electric transportation rally", "Plant festival", "Fighting for tomorrow", "Greenest Grass", "greta is comimg over"]
CATEGORIES = ["Road Block", "Fire Hazard", "Pot Hole", "Water Leak", "Trash Over-Flow", "Malfunctioning Taffic Light", "Sewer leak", "Other"]
LOCATIONS = ["Ben yehuda 32, tel aviv", "arlozorov 7, tel aviv", "ben zion 25, tel aviv", "basel 10, tel aviv", "habima square, tel aviv", "gordon beach, tel aviv", "dizengoff 123, tel aviv", "alrozorov 17, tel aviv"]
EVENT_DESCRIPTION = ["Come join the fight for our Planet!"]
REPORT_DESCRIPTION = ["Trash over-flowing", "There is a huge hole in the middle of the street", "the street light is not working", "there is sewer eveywhere!", "So many mosquitoes", "fire hydrant has blown up!"]

EVENT_PHOTOS =[
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event2_zk5cik.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event1_whcem1.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event_3_iihsez.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_9_m4drjx.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_7_wpn7jy.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_8_krelbk.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_6_lo12pa.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_4_obqkt2.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_5_ak8jzr.jpg"
]

REPORT_PHOTOS = [
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report2_tdzzre.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report3_hxalpu.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report5_v9jr5n.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report1_ff3wkn.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report4_swmx2b.jpg"
]

puts "creating 3 reports for omri"
3.times do
  Report.create!(
    user: omri,
    description: REPORT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    remote_photo_url: REPORT_PHOTOS.sample,
    upvote: 0,
    category: CATEGORIES.sample
    )
end

puts "creating 3 reports for ofir"
3.times do
  Report.create!(
    user: ofir,
    description: REPORT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    remote_photo_url: REPORT_PHOTOS.sample,
    upvote: 0,
    category: CATEGORIES.sample
    )
end

puts "creating 3 reports for alon"
3.times do
  Report.create!(
    user: alon,
    description: REPORT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    remote_photo_url: REPORT_PHOTOS.sample,
    upvote: 0,
    category: CATEGORIES.sample
    )
end

puts "creating 3 reports for noah"
3.times do
  Report.create!(
    user: noah,
    description: REPORT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    remote_photo_url: REPORT_PHOTOS.sample,
    upvote: 0,
    category: CATEGORIES.sample
    )
end

puts "creating 3 events"
3.times do
  Event.create!(
    description: EVENT_DESCRIPTION.sample,
    location: LOCATIONS.sample,
    name: EVENTNAMES.sample,
    date: Time.now,
    remote_photo_url: EVENT_PHOTOS.sample,
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
