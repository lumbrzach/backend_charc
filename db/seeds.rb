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
    gauge_num: 03070260
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
    gauge_num: 14181500
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
    gauge_name: ""
)

zach = User.create(
    username: "lumbrzach",
    password: "1234",
    avatar: "https://avatars0.githubusercontent.com/u/50035946?s=460&v=4",
    location: "Atlanta, GA",
    email: "parkerz97@yahoo.com"
)

dylan = User.create(
    username: "hotfire",
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

