# puts "destroying all events"
# Event.destroy_all

puts "destroying all reports"
Report.destroy_all

puts "destroying all users"
User.destroy_all

puts "destroying all events"
Event.destroy_all

# puts "creating 4 users"

# alon = User.create!(first_name: 'alon', last_name: 'shvartsman', email: 'alon@shvartsman.com', password: '123456', photo: 'https://res.cloudinary.com/dtgrzmgus/image/upload/v1575470200/alon_mb0qsd.jpg')
# noah = User.create!(first_name: 'noah', last_name: 'schlesinger', email: 'noah@schlesinger.com', password: '123456', photo: 'https://res.cloudinary.com/dtgrzmgus/image/upload/v1575470200/noah_zp00ur.jpg')
ofir = User.create!(first_name: 'Ofir', last_name: 'Elboym', email: 'ofir@elboym.com', password: '123456', photo: 'https://res.cloudinary.com/flameleviosa/image/upload/v1575110884/bf7wwpnozxixabpi6dqr.png')
omri = User.create!(first_name: 'Omri', last_name: 'Shabtay', email: 'omri@shabtay.com', password: '123456', photo: 'https://res.cloudinary.com/dtgrzmgus/image/upload/v1575470200/omri_fa4eoq.jpg')


# EVENTNAMES = ["Clean up the beach!", "Road side clean up!", "Climate change protest", "Save the turtles!", "Electric transportation rally", "Plant festival", "Fighting for tomorrow", "Greenest Grass", "greta is comimg over"]
# CATEGORIES = ["Road Block", "Fire Hazard", "Pothole", "Water Leak", "Trash Over-Flow", "Malfunctioning Taffic Light", "Sewer leak", "Other"]
LOCATIONS = ["Ben Yehuda 32, Tel Aviv", "Arlozorov 7, Tel Aviv", "Ben Zion 25, Tel Aviv", "Basel 10, Tel Aviv", "Habima Square, Tel Aviv", "Gordon Beach, Tel Aviv", "Dizengoff 123, Tel Aviv", "Alrozorov 17, Tel Aviv"]
# EVENT_DESCRIPTION = ["Come join the fight for our Planet!"]
REPORT_DESCRIPTION = ["Trash over-flowing", "There is a huge hole in the middle of the street", "The street light is not working", "There is sewer eveywhere!", "So many mosquitoes", "Fire hydrant has blown up!"]

# EVENT_PHOTOS =[
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event2_zk5cik.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event1_whcem1.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450149/event_3_iihsez.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_9_m4drjx.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_7_wpn7jy.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_8_krelbk.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_6_lo12pa.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_4_obqkt2.jpg",
#   "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575450148/event_5_ak8jzr.jpg"
# ]

REPORT_PHOTOS = [
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report2_tdzzre.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report3_hxalpu.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report5_v9jr5n.jpg",
  "https://res.cloudinary.com/dtgrzmgus/image/upload/v1575451563/report1_ff3wkn.jpg",
]


# puts "creating 3 reports for omri"
# 1.times do
#   Report.create!(
#     user: omri,
#     description: REPORT_DESCRIPTION.sample,
#     location: LOCATIONS.sample,
#     remote_photo_url: REPORT_PHOTOS.sample,
#     upvote: 0,
#     category: "Road Block"
#     )
# end

# puts "creating 3 reports for omri"
# 1.times do
#   Report.create!(
#     user: omri,
#     description: REPORT_DESCRIPTION.sample,
#     location: LOCATIONS.sample,
#     remote_photo_url: REPORT_PHOTOS.sample,
#     upvote: 0,
#     category: "other"
#     )
# end

puts "creating reports for ofir and omri"

1.times do
  Report.create!(
    user: ofir,
    description: "There is a huge pile of trash on the sidewalk. Not good.",
    location: "Arlozorov 7, Tel Aviv, Israel",
    remote_photo_url: "https://www.jpost.com/HttpHandlers/ShowImage.ashx?id=293819&w=898&h=628",
    upvote: rand(1..30),
    category: "Trash"
    )
end

1.times do
  Report.create!(
    user: omri,
    description: "Huge puddle in the middle of the road. Very dangerous",
    location: "Hovevey Tzion 103, Tel Aviv, Israel",
    remote_photo_url: "https://images.haarets.co.il/image/upload/w_609,h_343,q_auto,c_fill,f_auto/fl_any_format.preserve_transparency.progressive:none/v1544100830/1.6722982.712372222.jpg",
    upvote: rand(1..30),
    category: "Other"
    )
end

1.times do
  Report.create!(
    user: ofir,
    description: "Pothole in the middle of the road",
    location: "Ben Yehuda 32, Tel Aviv, Israel",
    remote_photo_url: "https://teachengineering.org/content/mis_/activities/mis_potholes/mis_potholes_lesson01_activity1_image1web.jpg",
    upvote: rand(1..30),
    category: "Pothole"
    )
end

1.times do
  Report.create!(
    user: omri,
    description: "Large tree blocking the sidewalk and road.",
    location: "Basel 10, Tel Aviv, Israel",
    remote_photo_url: "https://images.hamodia.com/hamod-uploads/2014/08/Tree.jpg",
    upvote: rand(1..30),
    category: "Road Block"
    )
end

1.times do
  Report.create!(
    user: ofir,
    description: "The street light on this corner broke. It doesn't turn green.",
    location: "Jabotinsky 153, Tel Aviv, Israel",
    remote_photo_url: "https://nocamels.com/wp-content/uploads/2019/06/yandex-light.jpeg",
    upvote: rand(1..30),
    category: "Street Light"
    )
end

1.times do
  Report.create!(
    user: omri,
    description: "So much trash it's impossible to pass through. Please help.",
    location: "Florentin St 13, Tel Aviv, Israel",
    remote_photo_url: "http://newzim.co.il/mizrah/wp-content/uploads/sites/6/2018/02/%D7%90%D7%9C%D7%A2%D7%93-%D7%93%D7%95%D7%99%D7%93-%D7%9C%D7%9B%D7%9C%D7%95%D7%9A-%D7%91%D7%AA%D7%9C-%D7%90%D7%91%D7%99%D7%91-630x350.jpg",
    upvote: rand(1..30),
    category: "Trash"
    )
end

1.times do
  Report.create!(
    user: ofir,
    description: "There is a sewer on Dizengoff Center that is spewing out water.",
    location: "Dizengoff Center, Tel Aviv, Israel",
    remote_photo_url: "http://www.mcity.co.il/files_media/d92dc0a7fbc95195ae7a112f5cf5b9f4.jpg",
    upvote: rand(1..30),
    category: "Sewage"
    )
end

1.times do
  Report.create!(
    user: ofir,
    description: "I've been walking by this trash for about 3 days now.",
    location: "Ibn Gabirol 74, Tel Aviv, Israel",
    remote_photo_url: "https://www.jpost.com/HttpHandlers/ShowImage.ashx?id=369110",
    upvote: rand(1..30),
    category: "Trash"
    )
end

1.times do
  Report.create!(
    user: omri,
    description: "Someone broke the window and there is glass everywhere ",
    location: "Lilienblum 18, Tel Aviv, Gush Dan, Israel",
    remote_photo_url: "https://www.dccommercialglassdoorsandwindowrepair.com/assets/img/broken%20storefront.jpg",
    upvote: rand(1..30),
    category: "Other"
    )
end

# puts "creating 3 reports for alon"
# 3.times do
#   Report.create!(
#     user: alon,
#     description: REPORT_DESCRIPTION.sample,
#     location: LOCATIONS.sample,
#     remote_photo_url: REPORT_PHOTOS.sample,
#     upvote: 0,
#     category: CATEGORIES.sample
#     )
# end

# puts "creating 3 reports for noah"
# 3.times do
#   Report.create!(
#     user: noah,
#     description: REPORT_DESCRIPTION.sample,
#     location: LOCATIONS.sample,
#     remote_photo_url: REPORT_PHOTOS.sample,
#     upvote: 0,
#     category: CATEGORIES.sample
#     )
# end

puts "creating 4 events"

  event_one = Event.create!(
    description: "There's No Planet B!",
    location: "Hertzel 83, Tel Aviv, Israel",
    name: "Join and learn about all the small changes you can make.",
    date: Time.now + rand(1..20),
    remote_photo_url: "https://res.cloudinary.com/flameleviosa/image/upload/v1575972830/planetb_mz1krm.jpg",
    )


puts "made a first event and chatroom"


  event_two = Event.create!(
    description: "Clean the Butts!",
    location: "Namal Tel Aviv, Israel",
    name: "Let's create the change we want to see in our city.",
    date: Time.now + rand(1..20),
    remote_photo_url: "https://res.cloudinary.com/flameleviosa/image/upload/v1575972028/butts_lrwxj6.jpg",
    )



  event_three = Event.create!(
    description: "Annual Beach Clean-up!",
    location: "Jerusalem beach, Tel Aviv, Israel",
    name: "More than 10,000 volunteers have collected over 1 million pounds of trash.",
    date: Time.now + rand(1..20),
    remote_photo_url: "https://res.cloudinary.com/flameleviosa/image/upload/v1575972032/cleanup_ccew7h.jpg",
    )



  event_four = Event.create!(
    description: "Join The Fight For Our Planet!",
    location: "Dizengoff 223, Tel Aviv, Israel",
    name: "Youth march for climate change awareness, everyone is invited!",
    date: Time.now + rand(1..20),
    remote_photo_url: "https://res.cloudinary.com/flameleviosa/image/upload/v1575972034/tlvstrike_wxdz0z.png",
    )


  puts "finished seeding!"
