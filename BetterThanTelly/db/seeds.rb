# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## CATEGORIES
# visualart = Category.create(name: "Visual Art")
# livemusic = Category.create(name: "Live Music")
# clubnight = Category.create(name: "Club Night")
# categories_new = Category.create [{name: "Art"},{name: "Music"}, {name: "Gastronomy"}]


# ## VENUES
# tatemodern = Venue.create(name: "Tate Modern", address: "Bankside, London")
# islingtonassembly = Venue.create(name: "Islington Assembly Hall", address: "Upper Street, Islington")
# fabric = Venue.create(name: "Fabric", address: "Charterhouse Street, London")
# venues_new = Venue.create [{name: "Modern Art Oxford", address: "30 Pembroke Street, Oxford, OX1 1BP"}, {name: "The Jam Factory", address: "4 Hollybush Row, Oxford, OX1 1HU"}, {name: "The Bullingdon", address: "162 Cowley Road, Oxford, OX4 1UE"}]


# ## USERS
# erin = User.create(name: "Erin", email: "erin@flatironschool.com", password_digest: "erin")
# ben = User.create(name: "Ben", email: "ben@flatironschool.com", password_digest: "ben")
# tegan = User.create(name: "Tegan", email: "tegan@flatironschool.com", password_digest: "ben")
# users_new = User.create [{email: "tom-morello@gmail.com", name:"Tom", password_digest: "tom"}, {email: "joshhomme@hotmail.com", name: "Josh", password_digest: "josh"}]


## EVENTS
event1 = Event.create(title: "Chris Ofili", event_date: "2019-12-31", event_time: "10:00", description: "A retrospective of artists' works", category_id: 1, venue_id: 1, user_id: 1)
event2 = Event.create(title: "That band you like", event_date: "2019-11-15", event_time: "19:00", description: "They're going to play their instruments live in front of you", category_id: 2, venue_id: 2, user_id: 2)
event3 = Event.create(title: "Superstar DJ night", event_date: "2020-01-10", event_time: "22:00", description: "Record scratch noises", category_id: 3, venue_id: 3, user_id: 3)


## REVIEWS 
erinsreview = Review.create(title: "Wow this was really nice", content: "This art show was so good, I really like to look at paintings. :) :)", event_id: 1, rating: 3)
bensreview = Review.create(title: "the best !!", content: "There is nothing better than going to see musicians play their instruments live in front of me. good sound system", event_id: 2, rating: 5)
tegansreview = Review.create(title: "this was the worst night of my life", content: "This evening was absolutely terrible. To anyone who thinks that they should go here, STAY AWAY", event_id: 3, rating: 1)

## EVENT ATTENDEES
attendee1 = EventAttendee.create(user_id: 1, event_id: 1)
attendee2 = EventAttendee.create(user_id: 2, event_id: 1)
attendee3 = EventAttendee.create(user_id: 3, event_id: 1)

attendee4 = EventAttendee.create(user_id: 1, event_id: 2)
attendee5 = EventAttendee.create(user_id: 2, event_id: 2)

attendee6 = EventAttendee.create(user_id: 1, event_id: 3)
