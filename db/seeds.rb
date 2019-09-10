# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Spot.destroy_all
UserSpot.destroy_all
Event.destroy_all
Journal.destroy_all
Photo.destroy_all
UserEvent.destroy_all
EventSpot.destroy_all


fascination_alley = Spot.create(
    name: "Fascination Alley",
    lat: 39.3971,
    long: -79.6887,
    country: "USA",
    city: "Albright",
    state: "WV",
    quality: "Epic",
    river: "Cheat",
    river_section: "",
    gauge_url: "https://waterdata.usgs.gov/wv/nwis/uv?03070260",
    min_flow: "500cfs",
    max_flow: "900cfs",
    ideal_flow: "700-1800cfs",
    description: "Amazing spot. Probably the best ever...",
    water_temp: "",
    current_cfs: "",
    current_height: "",
    gauge_name: "Albright",
    gauge_num: "03070260",
    region: ''
)
weasel = Spot.create(
    name: "The Weasel",
    lat: 44.7741,
    long: -122.5683,
    country: "USA",
    city: "Mill City",
    state: "OR",
    quality: "Epic",
    river: "North Santiam",
    river_section: "",
    gauge_url: "https://waterdata.usgs.gov/wv/nwis/uv?14181500",
    min_flow: "900cfs",
    max_flow: "2200cfs",
    ideal_flow: "1500cfs",
    description: "This place has TWO spots!!!",
    water_temp: "",
    current_cfs: "",
    current_height: "",
    gauge_name: "Niagara",
    gauge_num: "14181500",
    region: ''
)
leslie = Spot.create(
    name: "The Leslie",
    lat: 43.0789,
    long: -79.0762,
    country: "USA",
    city: "Reliance",
    state: "TN",
    quality: "Epic",
    river: "Hiwassee",
    river_section: "",
    gauge_url: "https://www.tva.gov/Environment/Lake-Levels/Apalachia",
    min_flow: "Unknown",
    max_flow: "Unknown",
    ideal_flow: "2 Generators",
    description: "Access takes a minute, but well worth the effort. COLD.",
    water_temp: "",
    current_cfs: "",
    current_height: "",
    gauge_name: "",
    region: ''
)

zach = User.create(
    username: "lumbrzach",
    password: "1234",
    avatar: "https://avatars0.githubusercontent.com/u/50035946?s=460&v=4",
    location: "Atlanta, GA",
    email: "parkerz97@yahoo.com"
)

dylan = User.create(
    username: "dylan",
    password: "1234",
    avatar: "https://avatars3.githubusercontent.com/u/46968785?s=460&v=4",
    location: "Atlanta, GA",
    email: "dylan@dylan.com"
)

us1 = UserSpot.create(
    user_id: zach.id,
    spot_id: leslie.id
)
us2 = UserSpot.create(
    user_id: zach.id,
    spot_id: weasel.id
)
us3 = UserSpot.create(
    user_id: zach.id,
    spot_id: fascination_alley.id
)
us4 = UserSpot.create(
    user_id: dylan.id,
    spot_id: leslie.id
)

p1 = Photo.create(
    spot_id: weasel.id,
    user_id: zach.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing"
)

p2 = Photo.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing"
)

p3 = Photo.create(
    spot_id: weasel.id,
    user_id: zach.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing2"
)

p4 = Photo.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing2"
)

p5 = Photo.create(
    spot_id: leslie.id,
    user_id: zach.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing"
)

p6 = Photo.create(
    spot_id: fascination_alley.id,
    user_id: leslie.id,
    source: "https://static.rootsrated.com/image/upload/s--Br0WUVP1--/t_rr_large_natural/r6ghydlioo3wn7xdaexe.jpg",
    comment: "testing2"
)

e1 = Event.create(
    name: "Drop Bombs at the Leslie",
    location: "The Leslie",
    description: "Meet at high noon to assault the Hiwassee",
    date: "2019-08-30",
    completed: false,
    alt_spot_1: "Cats Pajamas"
)

e2 = Event.create(
    name: "Sink at the Lelsie",
    location: "The Leslie",
    description: "Walking in at 12",
    date: "2019-10-20",
    completed: false,
    alt_spot_1: "Cats Pajamas"
)

e3 = Event.create(
    name: "Putting Wally in His Place",
    location: "Fascination Alley",
    description: "Fight the power",
    date: "2019-09-25",
    completed: false
)

e4 = Event.create(
    name: "Area 51 visit",
    location: "Fascination Alley",
    description: "Gobble, gobble",
    date: "2019-11-27",
    completed: false
)

e5 = Event.create(
    name: "Merry Christmas from Paradise",
    location: "Fascination Alley",
    description: "Ho, ho, ho!",
    date: "2019-12-25",
    completed: false
)

e6 = Event.create(
    name: "Weaseling Around",
    location: "The Weasel",
    description: "Camping and sinking",
    date: "2019-11-20",
    completed: false,
    alt_spot_1: "Gemini"
)

e7 = Event.create(
    name: "Sink at the Lelsie",
    location: "The Weasel",
    description: "Walking in at 12",
    date: "2019-10-20",
    completed: false,
    alt_spot_1: "Gemini"
)

e8 = Event.create(
    name: "Drop at the Weasel",
    location: "The Weasel",
    description: "Play with fish",
    date: "2019-10-20",
    completed: false,
    alt_spot_1: "Gemini"
)

ue1 = UserEvent.create(
    event_id: e8.id,
    user_id: zach.id
)
ue2 = UserEvent.create(
    event_id: e8.id,
    user_id: dylan.id
)
ue3 = UserEvent.create(
    event_id: e3.id,
    user_id: zach.id
)
ue4 = UserEvent.create(
    event_id: e3.id,
    user_id: dylan.id
)
ue5 = UserEvent.create(
    event_id: e1.id,
    user_id: zach.id
)
ue6 = UserEvent.create(
    event_id: e1.id,
    user_id: dylan.id
)

j1 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-11-20",
    river_level: "900cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Sat fat in Area 51 and had a ball. Little chilly.",
    quality: "10"
)
j2 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-11-20",
    river_level: "750cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Not the most retentive, but gentle. She played nice enough.",
    quality: "1"
)
j3 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-11-20",
    river_level: "500cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Getting low, but still so much fun.",
    quality: "1"
)
j4 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-07-20",
    river_level: "1400cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Not as retentive as lower levels, but still big downtime available.",
    quality: "7"
)
j5 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-05-20",
    river_level: "300cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Desperate for downtime. Nice swimming level though...",
    quality: "2"
)
j6 = Journal.create(
    spot_id: fascination_alley.id,
    user_id: zach.id,
    date: "2018-06-20",
    river_level: "1050cfs",
    pref_charc: "Righty ALL DAY",
    explore_notes: "Sat fat in Area 51 and had a ball.",
    quality: "10"
)

