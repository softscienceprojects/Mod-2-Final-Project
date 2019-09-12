# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EventAttendee.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all
Venue.destroy_all




# CATEGORIES

categories_new = Category.create [
    {name: "Visual Art"}, {name: "Live Music"}, {name: "Gastronomy"}, {name: "Club Night"}, {name: "Exhibition"}, {name: "Spoken Word"}, {name: "Theatre"}
    ]


## VENUES
tatemodern = Venue.create(name: "Tate Modern", address: "Bankside, London")
islingtonassembly = Venue.create(name: "Islington Assembly Hall", address: "Upper Street, Islington")
fabric = Venue.create(name: "Fabric", address: "Charterhouse Street, London")
venues_new = Venue.create [{name: "Modern Art Oxford", address: "30 Pembroke Street, Oxford, OX1 1BP"}, {name: "The Jam Factory", address: "4 Hollybush Row, Oxford, OX1 1HU"}, {name: "The Bullingdon", address: "162 Cowley Road, Oxford, OX4 1UE"}]


## USERS
erin = User.create(name: "Erin", email: "erin@flatironschool.com", password_digest: "erin")
ben = User.create(name: "Ben", email: "ben@flatironschool.com", password_digest: "ben")
tegan = User.create(name: "Tegan", email: "tegan@flatironschool.com", password_digest: "ben")
users_new = User.create [
    {email: "tom-morello@gmail.com", name:"Tom", password_digest: "tom"}, {email: "joshhomme@hotmail.com", name: "Josh", password_digest: "josh"},
    {email: "kate@gmail.com", name:"Kate", password_digest: "kate"}, {email: "bob@email.com", name: "Bob", password_digest: "bob"}
]


## EVENTS
event1 = Event.create(title: "Chris Ofili", event_date: "2019-12-31", event_time: "10:00", description: "A retrospective of artists' works", category_id: Category.first.id, venue_id: Venue.first.id, user_id: User.first.id)
event2 = Event.create(title: "That band you like", event_date: "2019-11-15", event_time: "19:00", description: "They're going to play their instruments live in front of you", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.second.id)
event3 = Event.create(title: "Superstar DJ night", event_date: "2020-01-10", event_time: "22:00", description: "Record scratch noises", category_id: Category.fourth.id, venue_id: Venue.third.id, user_id: User.third.id)

event4 = Event.create(title: "Rage Against The Machine", event_date: "2000-12-31", event_time: "08:00", description: "RATM!", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.fourth.id)
event5 = Event.create(title: "Event in Past", event_date: "2011-11-15", event_time: "19:00", description: "They're going to play their instruments live in front of you", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.second.id)
event6 = Event.create(title: "Queens of the Stone Age", event_date: "2019-10-10", event_time: "22:00", description: "All the hits!", category_id: Category.third.id, venue_id: Venue.third.id, user_id: User.fifth.id)
event7 = Event.create(title: "The seventh event!", event_date: "2017-10-10", event_time: "22:00", description: "777", category_id: Category.all[6].id, venue_id: Venue.third.id, user_id: User.fifth.id)


#######erin events
eevent1 = Event.create(title: "Trevor Paglen in Conversation", event_date: "2019-11-30", event_time: "19:00", description: "The digital-media artist discusses his latest project for the Barbican", category_id: Category.first.id, venue_id: Venue.first.id, user_id: User.first.id)
eevent2 = Event.create(title: "Kid Cudi", event_date: "2019-10-31", event_time: "20:00", description: "See Kid Cudi live in concert", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.second.id)
eevent3 = Event.create(title: "Blood Orange", event_date: "2020-02-14", event_time: "21:00", description: "The English artist returns with an exclusive launch of his latest album", category_id: Category.second.id, venue_id: Venue.third.id, user_id: User.third.id)

eevent4 = Event.create(title: "Nigela Lawson cookbook launch", event_date: "2019-09-30", event_time: "11:00", description: "Meet Nigella as she launches her newest cookbook of vegan recipes", category_id: Category.third.id, venue_id: Venue.first.id, user_id: User.fourth.id)
eevent5 = Event.create(title: "The secret past event", event_date: "2011-11-15", event_time: "19:00", description: "Doesn't matter because you missed it, anyway", category_id: Category.first.id, venue_id: Venue.fifth.id, user_id: User.second.id)
eevent6 = Event.create(title: "Peggy Gou NYE", event_date: "2019-12-31", event_time: "23:00", description: "Ring in the new year with Peggy Gou", category_id: Category.fourth.id, venue_id: Venue.third.id, user_id: User.fifth.id)
eevent7 = Event.create(title: "Anni Albers", event_date: "2019-10-15", event_time: "12:00", description: "One of the most important abstract artists on display in the UK for the first time", category_id: Category.fifth.id, venue_id: Venue.first.id, user_id: User.fifth.id)




## REVIEWS 
erinsreview = Review.create(title: "Wow this was really nice", content: "This art show was so good, I really like to look at paintings. :) :)", event_id: Event.fourth.id, rating: 4, user_id:User.first.id)
erinsreview2 = Review.create(title: "Wow this was really nice", content: "Great", event_id: Event.fifth.id, rating: 3, user_id:User.first.id)
bensreview = Review.create(title: "the best !!", content: "There is nothing better than going to see musicians play their instruments live in front of me. good sound system", event_id: Event.second.id, rating: 5, user_id:User.fifth.id)
tegansreview = Review.create(title: "this was the worst night of my life", content: "This evening was absolutely terrible. To anyone who thinks that they should go here, STAY AWAY", event_id: Event.third.id, rating: 1, user_id:User.third.id)

## EVENT ATTENDEES
attendee1 = EventAttendee.create(user_id: User.first.id, event_id: Event.first.id)
attendee2 = EventAttendee.create(user_id: User.second.id, event_id: Event.first.id)
attendee3 = EventAttendee.create(user_id: User.third.id, event_id: Event.first.id)
attendee4 = EventAttendee.create(user_id: User.first.id, event_id: Event.second.id)
attendee5 = EventAttendee.create(user_id: User.second.id, event_id: Event.second.id)
attendee6 = EventAttendee.create(user_id: User.first.id, event_id: Event.third.id)
attendee7 = EventAttendee.create(user_id: User.first.id, event_id: Event.fourth.id)
attendee8 = EventAttendee.create(user_id: User.first.id, event_id: Event.fifth.id)
attendee8 = EventAttendee.create(user_id: User.first.id, event_id: Event.all[5].id)
attendee9 = EventAttendee.create(user_id: User.first.id, event_id: Event.last.id)