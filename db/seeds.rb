# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin@email.com", password: "password", admin: true)
User.create(email: "terence@email.com", password: "password", admin: true)
User.create(email: "hongjin@email.com", password: "password", admin: true)
User.create(email: "simyen@email.com", password: "password", admin: true)

10.times do
  User.create!(
    email: Faker::Internet.safe_email,
    password: Faker::Internet.password(min_length: 8)
  )
end

14.times do |i|
  UserProfile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: "79 Anson Road",
    postalcode: "079906",
    phone: Faker::Number.number(digits: 10),
    username: Faker::Games::Pokemon.name,
    userLat: coordinates[0],
    userLong: coordinates[1],
    user_id: i+1,
  )
end

# 10.times do
#   Vet.create!(
#     email: Faker::Internet.safe_email,
#     password: Faker::Internet.password(min_length: 8)
#   )
# end

# Vet.create(email: "vet1@email.com", password: "password")
# Vet.create(email: "vet2@email.com", password: "password")
# Vet.create(email: "vet3@email.com", password: "password")

# coordinates = Geocoder.search("18 Jalan Pari Burong Singapore").first.coordinates

# 13.times do |i|
#   VetProfile.create!(
#     clinic_name: Faker::Company.name,
#     address: "18 Jalan Pari Burong",
#     country: "Singapore",
#     postalcode: "488684",
#     phone: Faker::Number.number(digits: 10),
#     hours: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     services: Faker::Company.catch_phrase,
#     vetLat: coordinates[0],
#     vetLong: coordinates[1],
#     vet_id: i+1
#   )
# end


vets = [
  [
    "Advanced Vet Care & Pet Emergency",
    "18 Jalan Pari Burong",
    "",
    488684,
    66361788,
    "advancedvetcare.sg"
  ],
  [
    "Animal World Veterinary Clinic Pte Ltd",
    "16 Yio Chu Kang Road",
    "",
    545527,
    62860929,
    "animalworldclinic.com"
  ],
  [
    "AAVC- Animal and Avian Veterinary Clinic",
    "716 Yishun Street 71",
    "#01-254",
    760716,
    68539397,
    "aavcsingapore.webs.com"
  ],
  [
    "Acacia Veterinary Clinic",
    "338 Ang Mo Kio Avenue 1",
    "#01-1671",
    560338,
    64816889,
    ""
  ],
  [
    "Allpets & Aqualife Clinic",
    "24 Jalan Kelulut",
    "Seletar Hills Estate",
    809041,
    64813700,
    "allpetsaqualife.com"
  ],
  [
    "Amber Cat Vet Pte Ltd",
    "48 Burnfoot Terrace",
    "Frankel Estate",
    459836,
    62455543,
    "ambercatvet.com"
  ],
  [
    "Amber Veterinary Practice Pte Ltd",
    "50 Burnfoot Terrace",
    "Frankel Estate",
    459837,
    62455543,
    "ambervet.com"
  ],
  [
    "Animal Infirmary",
    "74 Thomson Road",
    "",
    307590,
    63582663,
    "www.aivet.com.sg"
  ],
  [
    "Animal Medical Centre (VET@RV) Pte Ltd",
    "78 Indus Road",
    "#01-487, Indus Garden",
    161078,
    62710665,
    "VETatRV.com"
  ],
  [
    "Animal Practice Pte Ltd",
    "1015 Upper Serangoon Road",
    "#01-00",
    534753,
    62883929,
    "animalpractice.com.sg"
  ],
  [
    "Animal Ark Veterinary Group (Animal Ark Binjai)",
    "11 Binjai Park",
    "",
    589823,
    61006000,
    "arkvet.com.sg"
  ],
  [
    "Animal Ark Veterinary Group (Animal Ark Greendale)",
    "3 Greendale Avenue",
    "",
    289498,
    6463710,
    "arkvet.com.sg"
  ],
  [
    "Animal Ark Veterinary Group (Animal Ark Tampines)",
    "139 Tampines Street 11",
    "#01-42",
    521139,
    "65871797 / 65871798",
    "arkvet.com.sg"
  ],
  [
    "Animal Ark Veterinary Group (Animal Ark TCM)",
    "139 Tampines Street 11",
    "#01-62",
    521139,
    67893578,
    "arkvet.com.sg"
  ],
  [
    "Animal Recovery Veterinary Referral Centre Pte Ltd",
    "466 Serangoon Road",
    "",
    218225,
    62522623,
    "doctorsbeckandstone.com"
  ],
  [
    "Barkway Pet Health",
    "169 Macpherson Road",
    "",
    348535,
    "69044300 / 69044301",
    "Barkway.sg"
  ],
  [
    "Brighton Vet Care Pte Ltd",
    "74 Serangoon Garden Way",
    "",
    555970,
    62822484,
    "brightonvetcare.com"
  ],
  [
    "Care Veterinary Clinic Pte Ltd",
    "Blk 124 Toa Payoh Lorong 1",
    "#01-473",
    310124,
    62500535,
    "carevetclinic.com.sg"
  ],
  [
    "Clinic For Pets",
    "1015 Geylang East Avenue 3",
    "#01-141",
    389730,
    67451337,
    "clinicforpets.sg"
  ],
  [
    "Companion Animal Surgery Pte Ltd",
    "12 Boon Teck Rd",
    "#01-04/05 Shaw Corner",
    329586,
    62557950,
    "comvet.com"
  ],
  [
    "Defu Veterinary Clinic",
    "37 Defu Lane 10",
    "#01-79",
    539214,
    62848411,
    "defuvetclinic.com"
  ],
  [
    "Edmond Tan Veterinary Surgery",
    "151 Serangoon North Avenue 2",
    "#01-65",
    550151,
    62821581,
    ""
  ],
  [
    "Frankel Veterinary Centre",
    "101 Frankel Avenue",
    "",
    458224,
    68761212,
    "frankelvet.com.sg"
  ],
  [
    "Genesis Veterinary Clinic",
    "935 Yishun Central 1",
    "#01-43",
    760935,
    62570682,
    "www.genesisvet.com.sg"
  ],
  [
    "Gentle Oak Veterinary Clinic",
    "21 Ghim Moh Road",
    "#01-225",
    270021,
    62508001,
    "gentleoakvet.com.sg"
  ],
  [
    "Island Veterinary Clinic",
    "114 Jurong East St 13",
    "Jurong East Ville, #01-404",
    600114,
    65605991,
    "ivc.com.sg"
  ],
  [
    "Island Veterinary Clinic (Northeast)",
    "123 Bedok North Street 2",
    "#01-154",
    460123,
    64494491,
    "ivc.com.sg"
  ],
  [
    "James Tan Veterinary Centre Pte Ltd",
    "230 Whitley Road",
    "",
    297823,
    62531122,
    "jtvet.com"
  ],
  [
    "Jireh Veterinary Clinic Pte Ltd",
    "530 Balestier Road",
    "Monville Mansion #01-04",
    329857,
    62669566,
    "jirehvets.com.sg"
  ],
  [
    "Landon Veterinary Specialists",
    "41 Eng Kong Terrace",
    "",
    599013,
    64637228,
    "lvs.com.sg"
  ],
  [
    "Light of Life Veterinary Clinic and Services",
    "703 Bedok Reservoir Road",
    "#01-3508",
    470703,
    62433282,
    "light-of-life-vet-clinic.webs.com"
  ],
  [
    "Maranatha Veterinary Clinic",
    "77 Telok Blangah Drive",
    "#01-234",
    100077,
    62730100,
    "maranathavet@hotmail.com"
  ],
  [
    "Monster Pet Vet",
    "6 Everton Park",
    "#01-14/16",
    "080006",
    63279148,
    "monsterpetvet.com"
  ],
  [
    "Mount Pleasant Animal Clinic (East)",
    "152 East Coast Road",
    "",
    428855,
    63486110,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Animal Clinic (North)",
    "151 Serangoon North Avenue 2",
    "#01-59",
    550151,
    62871190,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Animal Medical Centre (Bedok)",
    "158 Bedok South Avenue 3",
    "#01-577",
    460158,
    64443561,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Animal Medical Centre (Clementi)",
    "105 Clementi Street 12",
    "#01-18/20",
    120105,
    67768858,
    "www.mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Animal Medical Centre (Farrer)",
    "Block 3, Queens Road",
    "#02-141",
    260003,
    62711132,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Referral Clinic",
    "232 Whitley Road",
    "",
    297824,
    62508333,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Veterinary Centre (Changi)",
    "969A Upper Changi Road North",
    "",
    507667,
    65460166,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Veterinary Centre (Gelenggang)",
    "2 Jalan Gelenggang",
    "",
    578187,
    62517666,
    "mountpleasant.com.sg"
  ],
  [
    "Mount Pleasant Veterinary Centre (Mandai)",
    "5 Mandai Road",
    "",
    779391,
    64515242,
    "mountpleasant.com.sg"
  ],
  [
    "My Family Vet Clinic and Surgery Pte Ltd",
    "265 Bukit Batok East Avenue 4",
    "#01-403",
    650265,
    65660448,
    ""
  ],
  [
    "Namly Animal Clinic Pte Ltd",
    "74 Namly Place",
    "",
    267223,
    64694744,
    ""
  ],
  [
    "Nam Sang Veterinary Clinic Pte Ltd",
    "2 Balestier Road",
    "#01-697 Balestier Shopping Center",
    320002,
    62548138,
    "namsangveterinaryclinic.webs.com"
  ],
  [
    "Oasis Veterinary Clinic",
    "15 Venus Road",
    "",
    574302,
    62562693,
    "oasis-vet.com"
  ],
  [
    "Ohana VetCare",
    "258 Pasir Ris Street 21",
    "Loyang Point #04-01",
    510258,
    62829070,
    "ohanavetcare.com.sg"
  ],
  [
    "Passion Veterinary Clinic Pte Ltd",
    "Blk 111 Woodlands Street 13",
    "#01-86",
    730111,
    66358725,
    "passionvet.com"
  ],
  [
    "P.A.W (People Animal Wellness) Veterinary Centre",
    "Blk 112 Bukit Purmei Road",
    "#01-207",
    "090112",
    62737573,
    "paw.sg"
  ],
  [
    "Pet Care Centre & Clinic Pte Ltd",
    "4 Waringin Park",
    "Sin Chuan Garden",
    416318,
    64485835,
    ""
  ],
  [
    "Pet Clinic Pte Ltd",
    "211 Serangoon Avenue 4",
    "#01-12",
    550211,
    62885565,
    ""
  ],
  [
    "Pets Avenue Veterinary Clinic",
    "8 Empress Road",
    "#01-11",
    260008,
    64710111,
    "petsavenue.com.sg"
  ],
  [
    "Point Veterinary Surgery",
    "541 Jurong West Avenue 1",
    "#01-1044",
    640541,
    64256772,
    "pointveterinarysurgery.com"
  ],
  [
    "Point Veterinary Surgery (Telok Blangah)",
    "38 Telok Blangah Rise",
    "#01-339",
    "090038",
    62741677,
    "pointveterinarysurgery.com"
  ],
  [
    "Queen's Veterinary Surgery (Queen's Vets)",
    "3 Queen's Road",
    "#02-155",
    260003,
    64750038,
    ""
  ],
  [
    "RehabVet Pte. Ltd.",
    "513 Serangoon Rd",
    "#01-01",
    218154,
    62916881,
    "www.rehabvet.com"
  ],
  [
    "Singapore Turf Club Equine Hospital",
    "1 Turf Club Avenue",
    "Singapore Racecourse",
    738078,
    68791000,
    ""
  ],
  [
    "Singapore Veterinary Animal Clinic",
    "768 Woodlands Avenue 6",
    "#01-11",
    730768,
    63650308,
    "singvet.wordpress.com"
  ],
  [
    "SPCA Clinic *Community Animals Only",
    "50 Sungei Tengah Road",
    "",
    699012,
    62875355,
    "spca.org.sg/services_clinic.asp"
  ],
  [
    "Spring Veterinary Care",
    "Blk 123, Hougang Ave 1",
    "#01-1412",
    530123,
    62863313,
    "springvet.com.sg"
  ],
  [
    "Stars Veterinary Clinic",
    "211 Hougang Street 21",
    "#01-301",
    530211,
    62809880,
    "starsveterinaryclinic.com"
  ],
  [
    "Stars Veterinary Night Clinic",
    "211 Hougang Street 21",
    "#01-301",
    530211,
    62809880,
    "starsveterinaryclinic.com"
  ],
  [
    "The Animal Clinic Pte Ltd (Katong Branch)",
    "55 Lorong L, Telok Kurau",
    "#01-63",
    425500,
    64404767,
    "animalclinic.com.sg"
  ],
  [
    "The Animal Clinic Pte Ltd (Clementi)",
    "109 Clementi Street 11",
    "#01-19",
    120109,
    67744464,
    "animalclinic.com.sg"
  ],
  [
    "The Animal Doctors",
    "Blk 108 Ang Mo Kio Ave. 4",
    "#01-94/96",
    560108,
    64514531,
    "theanimaldoctors.com.sg"
  ],
  [
    "The Animal Doctors (Tiong Bahru)",
    "11A Boon Tiong Road",
    "Next to Tiong Bahru Plaza #02-07/08",
    161011,
    62533023,
    "theanimaldoctors.com.sg"
  ],
  [
    "The Cat Clinic",
    "109 Clementi Street 11",
    "#01-33",
    120109,
    67763450,
    ""
  ],
  [
    "The Joyous Vet",
    "Blk 475 Choa Chu Kang Ave 3",
    "#01-30A, Sunshine Place",
    680475,
    67690304,
    "tjv.com.sg"
  ],
  [
    "The Joyous Vet (Yuan Ching)",
    "1 Yuan Ching Road",
    "#03-03",
    618640,
    "62674137 / 62674138",
    "tjv.com.sg"
  ],
  [
    "The Pet Doctors Veterinary Clinic",
    "3 Pandan Valley",
    "#01-311 Pandan Valley Condominium",
    597627,
    64387779,
    "petdoctors.com.sg"
  ],
  [
    "The Veterinary Clinic (Holland Village)",
    "31A & 33A Lorong Liput",
    "",
    277742,
    64686312,
    "vetclinic.sg"
  ],
  [
    "The Veterinary Clinic (Tampines)",
    "476 Tampines Street 44",
    "#01-201",
    520476,
    67842048,
    "vetclinic.sg"
  ],
  [
    "The Visiting Vets Clinic",
    "9 Taman serasi",
    "#01-09",
    257720,
    64753405,
    "thevisitingvets.com.sg"
  ],
  [
    "Toa Payoh Vets (Toa Payoh Veterinary Surgery)",
    "1002 Toa Payoh Lorong 8",
    "#01-1477",
    319074,
    62543326,
    "toapayohvets.com"
  ],
  [
    "Town Vets Animal Clinic",
    "22 Havelock Road",
    "#01-687",
    160022,
    62767026,
    "townvets.com.sg"
  ],
  [
    "United Veterinary Clinic",
    "107 Ang Mo Kio Ave 4",
    "#01-148",
    560107,
    64556880,
    "unitedvetclinic.com"
  ],
  [
    "Vet Central",
    "Blk 69, Lorong 4 Toa Payoh",
    "#01-357",
    310069,
    66358646,
    "vetcentral.com.sg"
  ],
  [
    "Veterinary Emergency and Specialty Hospital (VES)",
    "2-14 Rochdale Road",
    "",
    535815,
    65817028,
    "veshospital.com.sg"
  ],
  [
    "Vets for Life Animal Clinic",
    "491 River Valley Road",
    "Valley Point #01-05/06",
    248371,
    67320273,
    "vetsforlife.com.sg"
  ],
  [
    "Vets for Life Animal Clinic",
    "330B Tanjong Katong Road",
    "",
    437106,
    63488346,
    "vetsforlife.com.sg"
  ],
  [
    "Vets for Life Animal Clinic",
    "330B Tanjong Katong Road",
    "",
    437106,
    63488346,
    "vetsforlife.com.sg"
  ],
  [
    "Vet Practice Pte Ltd",
    "21 Lorong Kilat",
    "#01-04/05",
    598123,
    64621757,
    "vetpractice.com.sg"
  ],
  [
    "Vet Practice Pte Ltd (Holland Branch)",
    "31 Holland Close",
    "#01-219",
    270031,
    67785285,
    "vetpractice.com.sg"
  ],
  [
    "West Coast Vetcare",
    "612 Clementi West Street 1",
    "#01-300",
    120612,
    67777423,
    "westcoast-vetcare.com"
  ],
  [
    "Woodgrove Veterinary Services",
    "30 Woodlands Avenue 1",
    "#02-06",
    739065,
    69090264,
    ""
  ]
]

require "open-uri"

vets.each_with_index do |vet, index|

  Vet.create(email: "vet#{index+1}@email.com", password: "password")

  result = JSON.load(open("https://developers.onemap.sg/commonapi/search?searchVal=#{vet[3]}&returnGeom=Y&getAddrDetails=Y"))
  vetLat = result["results"][0]["LATITUDE"]
  vetLong = result["results"][0]["LONGITUDE"]
  address = result["results"][0]["ADDRESS"]
  VetProfile.create(
    clinic_name: vet[0],
    address: address,
    unit: vet[2],
    country: "Singapore",
    postalcode: vet[3],
    phone: vet[4],
    website: vet[5],
    vetLat: vetLat,
    vetLong: vetLong,
    vet_id: Vet.last.id
  )
end