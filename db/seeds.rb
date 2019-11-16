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

result = JSON.load(open("https://developers.onemap.sg/commonapi/search?searchVal=079906&returnGeom=Y&getAddrDetails=Y"))
lat = result["results"][0]["LATITUDE"]
long = result["results"][0]["LONGITUDE"]
address = result["results"][0]["ADDRESS"]

14.times do |i|
  UserProfile.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: address,
    postalcode: "079906",
    phone: "31589593",
    username: Faker::Games::Pokemon.name,
    userLat: lat,
    userLong: long,
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
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjElMjIlM0VBZHZhbmNlZCUyMFZldCUyMENhcmUlMjAlMjZhbXAlM0IlMjBQZXQlMjBFbWVyZ2VuY3klM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Advanced Vet Care & Pet Emergency",
    "18 Jalan Pari Burong",
    "",
    488684,
    66361788,
    "advancedvetcare.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjIlMjIlM0VBbmltYWwlMjBXb3JsZCUyMFZldGVyaW5hcnklMjBDbGluaWMlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal World Veterinary Clinic Pte Ltd",
    "16 Yio Chu Kang Road",
    "",
    545527,
    62860929,
    "animalworldclinic.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjMlMjIlM0VBQVZDLSUyMEFuaW1hbCUyMGFuZCUyMEF2aWFuJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "AAVC- Animal and Avian Veterinary Clinic",
    "716 Yishun Street 71",
    "#01-254",
    760716,
    68539397,
    "aavcsingapore.webs.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQlMjIlM0VBY2FjaWElMjBWZXRlcmluYXJ5JTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Acacia Veterinary Clinic",
    "338 Ang Mo Kio Avenue 1",
    "#01-1671",
    560338,
    64816889,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjUlMjIlM0VBbGxwZXRzJTIwJTI2YW1wJTNCJTIwQXF1YWxpZmUlMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Allpets & Aqualife Clinic",
    "24 Jalan Kelulut",
    "Seletar Hills Estate",
    809041,
    64813700,
    "allpetsaqualife.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjYlMjIlM0VBbWJlciUyMENhdCUyMFZldCUyMFB0ZSUyMEx0ZCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Amber Cat Vet Pte Ltd",
    "48 Burnfoot Terrace",
    "Frankel Estate",
    459836,
    62455543,
    "ambercatvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjclMjIlM0VBbWJlciUyMFZldGVyaW5hcnklMjBQcmFjdGljZSUyMFB0ZSUyMEx0ZCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Amber Veterinary Practice Pte Ltd",
    "50 Burnfoot Terrace",
    "Frankel Estate",
    459837,
    62455543,
    "ambervet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjglMjIlM0VBbmltYWwlMjBJbmZpcm1hcnklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Infirmary",
    "74 Thomson Road",
    "",
    307590,
    63582663,
    "www.aivet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjklMjIlM0VBbmltYWwlMjBNZWRpY2FsJTIwQ2VudHJlJTIwKFZFVCU0MFJWKSUyMFB0ZSUyMEx0ZCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Animal Medical Centre (VET@RV) Pte Ltd",
    "78 Indus Road",
    "#01-487, Indus Garden",
    161078,
    62710665,
    "VETatRV.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjEwJTIyJTNFQW5pbWFsJTIwUHJhY3RpY2UlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Practice Pte Ltd",
    "1015 Upper Serangoon Road",
    "#01-00",
    534753,
    62883929,
    "animalpractice.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjExJTIyJTNFQW5pbWFsJTIwQXJrJTIwVmV0ZXJpbmFyeSUyMEdyb3VwJTIwKEFuaW1hbCUyMEFyayUyMEJpbmphaSklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Ark Veterinary Group (Animal Ark Binjai)",
    "11 Binjai Park",
    "",
    589823,
    61006000,
    "arkvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjEyJTIyJTNFQW5pbWFsJTIwQXJrJTIwVmV0ZXJpbmFyeSUyMEdyb3VwJTIwKEFuaW1hbCUyMEFyayUyMEdyZWVuZGFsZSklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Ark Veterinary Group (Animal Ark Greendale)",
    "3 Greendale Avenue",
    "",
    289498,
    6463710,
    "arkvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjEzJTIyJTNFQW5pbWFsJTIwQXJrJTIwVmV0ZXJpbmFyeSUyMEdyb3VwJTIwKEFuaW1hbCUyMEFyayUyMFRhbXBpbmVzKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Animal Ark Veterinary Group (Animal Ark Tampines)",
    "139 Tampines Street 11",
    "#01-42",
    521139,
    "65871797 / 65871798",
    "arkvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE0JTIyJTNFQW5pbWFsJTIwQXJrJTIwVmV0ZXJpbmFyeSUyMEdyb3VwJTIwKEFuaW1hbCUyMEFyayUyMFRDTSklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Ark Veterinary Group (Animal Ark TCM)",
    "139 Tampines Street 11",
    "#01-62",
    521139,
    67893578,
    "arkvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE1JTIyJTNFQW5pbWFsJTIwUmVjb3ZlcnklMjBWZXRlcmluYXJ5JTIwUmVmZXJyYWwlMjBDZW50cmUlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Animal Recovery Veterinary Referral Centre Pte Ltd",
    "466 Serangoon Road",
    "",
    218225,
    62522623,
    "doctorsbeckandstone.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE2JTIyJTNFQmFya3dheSUyMFBldCUyMEhlYWx0aCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Barkway Pet Health",
    "169 Macpherson Road",
    "",
    348535,
    "69044300 / 69044301",
    "Barkway.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE3JTIyJTNFQnJpZ2h0b24lMjBWZXQlMjBDYXJlJTIwUHRlJTIwTHRkJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Brighton Vet Care Pte Ltd",
    "74 Serangoon Garden Way",
    "",
    555970,
    62822484,
    "brightonvetcare.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE4JTIyJTNFQ2FyZSUyMFZldGVyaW5hcnklMjBDbGluaWMlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Care Veterinary Clinic Pte Ltd",
    "Blk 124 Toa Payoh Lorong 1",
    "#01-473",
    310124,
    62500535,
    "carevetclinic.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjE5JTIyJTNFQ2xpbmljJTIwRm9yJTIwUGV0cyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Clinic For Pets",
    "1015 Geylang East Avenue 3",
    "#01-141",
    389730,
    67451337,
    "clinicforpets.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjIwJTIyJTNFQ29tcGFuaW9uJTIwQW5pbWFsJTIwU3VyZ2VyeSUyMFB0ZSUyMEx0ZCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Companion Animal Surgery Pte Ltd",
    "12 Boon Teck Rd",
    "#01-04/05 Shaw Corner",
    329586,
    62557950,
    "comvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjIxJTIyJTNFRGVmdSUyMFZldGVyaW5hcnklMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Defu Veterinary Clinic",
    "37 Defu Lane 10",
    "#01-79",
    539214,
    62848411,
    "defuvetclinic.com"
  ],
  [
    "i!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjIyJTIyJTNFRWRtb25kJTIwVGFuJTIwVmV0ZXJpbmFyeSUyMFN1cmdlcnklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Edmond Tan Veterinary Surgery",
    "151 Serangoon North Avenue 2",
    "#01-65",
    550151,
    62821581,
    ""
  ],
  [
    "i!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjIzJTIyJTNFRnJhbmtlbCUyMFZldGVyaW5hcnklMjBDZW50cmUlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Frankel Veterinary Centre",
    "101 Frankel Avenue",
    "",
    458224,
    68761212,
    "frankelvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI0JTIyJTNFR2VuZXNpcyUyMFZldGVyaW5hcnklMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Genesis Veterinary Clinic",
    "935 Yishun Central 1",
    "#01-43",
    760935,
    62570682,
    "www.genesisvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI1JTIyJTNFR2VudGxlJTIwT2FrJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Gentle Oak Veterinary Clinic",
    "21 Ghim Moh Road",
    "#01-225",
    270021,
    62508001,
    "gentleoakvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI2JTIyJTNFSXNsYW5kJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Island Veterinary Clinic",
    "114 Jurong East St 13",
    "Jurong East Ville, #01-404",
    600114,
    65605991,
    "ivc.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI3JTIyJTNFSXNsYW5kJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUyMChOb3J0aGVhc3QpJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Island Veterinary Clinic (Northeast)",
    "123 Bedok North Street 2",
    "#01-154",
    460123,
    64494491,
    "ivc.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI4JTIyJTNFSmFtZXMlMjBUYW4lMjBWZXRlcmluYXJ5JTIwQ2VudHJlJTIwUHRlJTIwTHRkJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "James Tan Veterinary Centre Pte Ltd",
    "230 Whitley Road",
    "",
    297823,
    62531122,
    "jtvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjI5JTIyJTNFSmlyZWglMjBWZXRlcmluYXJ5JTIwQ2xpbmljJTIwUHRlJTIwTHRkJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Jireh Veterinary Clinic Pte Ltd",
    "530 Balestier Road",
    "Monville Mansion #01-04",
    329857,
    62669566,
    "jirehvets.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjMwJTIyJTNFTGFuZG9uJTIwVmV0ZXJpbmFyeSUyMFNwZWNpYWxpc3RzJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Landon Veterinary Specialists",
    "41 Eng Kong Terrace",
    "",
    599013,
    64637228,
    "lvs.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjMxJTIyJTNFTGlnaHQlMjBvZiUyMExpZmUlMjBWZXRlcmluYXJ5JTIwQ2xpbmljJTIwYW5kJTIwU2VydmljZXMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Light of Life Veterinary Clinic and Services",
    "703 Bedok Reservoir Road",
    "#01-3508",
    470703,
    62433282,
    "light-of-life-vet-clinic.webs.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjMyJTIyJTNFTWFyYW5hdGhhJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Maranatha Veterinary Clinic",
    "77 Telok Blangah Drive",
    "#01-234",
    100077,
    62730100,
    "maranathavet@hotmail.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjMzJTIyJTNFTW9uc3RlciUyMFBldCUyMFZldCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Monster Pet Vet",
    "6 Everton Park",
    "#01-14/16",
    "080006",
    63279148,
    "monsterpetvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM0JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMEFuaW1hbCUyMENsaW5pYyUyMChFYXN0KSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Mount Pleasant Animal Clinic (East)",
    "152 East Coast Road",
    "",
    428855,
    63486110,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM1JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMEFuaW1hbCUyMENsaW5pYyUyMChOb3J0aCklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Mount Pleasant Animal Clinic (North)",
    "151 Serangoon North Avenue 2",
    "#01-59",
    550151,
    62871190,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM2JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMEFuaW1hbCUyME1lZGljYWwlMjBDZW50cmUlMjAoQmVkb2spJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Mount Pleasant Animal Medical Centre (Bedok)",
    "158 Bedok South Avenue 3",
    "#01-577",
    460158,
    64443561,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM3JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMEFuaW1hbCUyME1lZGljYWwlMjBDZW50cmUlMjAoQ2xlbWVudGkpJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Mount Pleasant Animal Medical Centre (Clementi)",
    "105 Clementi Street 12",
    "#01-18/20",
    120105,
    67768858,
    "www.mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM4JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMEFuaW1hbCUyME1lZGljYWwlMjBDZW50cmUlMjAoRmFycmVyKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Mount Pleasant Animal Medical Centre (Farrer)",
    "Block 3, Queens Road",
    "#02-141",
    260003,
    62711132,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjM5JTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMFJlZmVycmFsJTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Mount Pleasant Referral Clinic",
    "232 Whitley Road",
    "",
    297824,
    62508333,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQwJTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMFZldGVyaW5hcnklMjBDZW50cmUlMjAoQ2hhbmdpKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Mount Pleasant Veterinary Centre (Changi)",
    "969A Upper Changi Road North",
    "",
    507667,
    65460166,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQxJTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMFZldGVyaW5hcnklMjBDZW50cmUlMjAoR2VsZW5nZ2FuZyklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Mount Pleasant Veterinary Centre (Gelenggang)",
    "2 Jalan Gelenggang",
    "",
    578187,
    62517666,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQyJTIyJTNFTW91bnQlMjBQbGVhc2FudCUyMFZldGVyaW5hcnklMjBDZW50cmUlMjAoTWFuZGFpKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Mount Pleasant Veterinary Centre (Mandai)",
    "5 Mandai Road",
    "",
    779391,
    64515242,
    "mountpleasant.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQzJTIyJTNFTXklMjBGYW1pbHklMjBWZXQlMjBDbGluaWMlMjBhbmQlMjBTdXJnZXJ5JTIwUHRlJTIwTHRkJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "My Family Vet Clinic and Surgery Pte Ltd",
    "265 Bukit Batok East Avenue 4",
    "#01-403",
    650265,
    65660448,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ0JTIyJTNFTmFtbHklMjBBbmltYWwlMjBDbGluaWMlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Namly Animal Clinic Pte Ltd",
    "74 Namly Place",
    "",
    267223,
    64694744,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ1JTIyJTNFTmFtJTIwU2FuZyUyMFZldGVyaW5hcnklMjBDbGluaWMlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Nam Sang Veterinary Clinic Pte Ltd",
    "2 Balestier Road",
    "#01-697 Balestier Shopping Center",
    320002,
    62548138,
    "namsangveterinaryclinic.webs.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ2JTIyJTNFT2FzaXMlMjBWZXRlcmluYXJ5JTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Oasis Veterinary Clinic",
    "15 Venus Road",
    "",
    574302,
    62562693,
    "oasis-vet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ3JTIyJTNFT2hhbmElMjBWZXRDYXJlJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Ohana VetCare",
    "258 Pasir Ris Street 21",
    "Loyang Point #04-01",
    510258,
    62829070,
    "ohanavetcare.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ4JTIyJTNFUGFzc2lvbiUyMFZldGVyaW5hcnklMjBDbGluaWMlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Passion Veterinary Clinic Pte Ltd",
    "Blk 111 Woodlands Street 13",
    "#01-86",
    730111,
    66358725,
    "passionvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjQ5JTIyJTNFUC5BLlclMjAoUGVvcGxlJTIwQW5pbWFsJTIwV2VsbG5lc3MpJTIwVmV0ZXJpbmFyeSUyMENlbnRyZSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "P.A.W (People Animal Wellness) Veterinary Centre",
    "Blk 112 Bukit Purmei Road",
    "#01-207",
    "090112",
    62737573,
    "paw.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjUwJTIyJTNFUGV0JTIwQ2FyZSUyMENlbnRyZSUyMCUyNmFtcCUzQiUyMENsaW5pYyUyMFB0ZSUyMEx0ZCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Pet Care Centre & Clinic Pte Ltd",
    "4 Waringin Park",
    "Sin Chuan Garden",
    416318,
    64485835,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjUxJTIyJTNFUGV0JTIwQ2xpbmljJTIwUHRlJTIwTHRkJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Pet Clinic Pte Ltd",
    "211 Serangoon Avenue 4",
    "#01-12",
    550211,
    62885565,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjUyJTIyJTNFUGV0cyUyMEF2ZW51ZSUyMFZldGVyaW5hcnklMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Pets Avenue Veterinary Clinic",
    "8 Empress Road",
    "#01-11",
    260008,
    64710111,
    "petsavenue.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjUzJTIyJTNFUG9pbnQlMjBWZXRlcmluYXJ5JTIwU3VyZ2VyeSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Point Veterinary Surgery",
    "541 Jurong West Avenue 1",
    "#01-1044",
    640541,
    64256772,
    "pointveterinarysurgery.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU0JTIyJTNFUG9pbnQlMjBWZXRlcmluYXJ5JTIwU3VyZ2VyeSUyMChUZWxvayUyMEJsYW5nYWgpJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Point Veterinary Surgery (Telok Blangah)",
    "38 Telok Blangah Rise",
    "#01-339",
    "090038",
    62741677,
    "pointveterinarysurgery.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU1JTIyJTNFUXVlZW4ncyUyMFZldGVyaW5hcnklMjBTdXJnZXJ5JTIwKFF1ZWVuJ3MlMjBWZXRzKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Queen's Veterinary Surgery (Queen's Vets)",
    "3 Queen's Road",
    "#02-155",
    260003,
    64750038,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU2JTIyJTNFUmVoYWJWZXQlMjBQdGUuJTIwTHRkLiUzQyUyRmElM0UlM0MlMkZwJTNF",
    "RehabVet Pte. Ltd.",
    "513 Serangoon Rd",
    "#01-01",
    218154,
    62916881,
    "www.rehabvet.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU3JTIyJTNFU2luZ2Fwb3JlJTIwVHVyZiUyMENsdWIlMjBFcXVpbmUlMjBIb3NwaXRhbCUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Singapore Turf Club Equine Hospital",
    "1 Turf Club Avenue",
    "Singapore Racecourse",
    738078,
    68791000,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU4JTIyJTNFU2luZ2Fwb3JlJTIwVmV0ZXJpbmFyeSUyMEFuaW1hbCUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "Singapore Veterinary Animal Clinic",
    "768 Woodlands Avenue 6",
    "#01-11",
    730768,
    63650308,
    "singvet.wordpress.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjU5JTIyJTNFU1BDQSUyMENsaW5pYyUyMCpDb21tdW5pdHklMjBBbmltYWxzJTIwT25seSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "SPCA Clinic *Community Animals Only",
    "50 Sungei Tengah Road",
    "",
    699012,
    62875355,
    "spca.org.sg/services_clinic.asp"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjYwJTIyJTNFU3ByaW5nJTIwVmV0ZXJpbmFyeSUyMENhcmUlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Spring Veterinary Care",
    "Blk 123, Hougang Ave 1",
    "#01-1412",
    530123,
    62863313,
    "springvet.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjYxJTIyJTNFU3RhcnMlMjBWZXRlcmluYXJ5JTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Stars Veterinary Clinic",
    "211 Hougang Street 21",
    "#01-301",
    530211,
    62809880,
    "starsveterinaryclinic.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjYyJTIyJTNFU3RhcnMlMjBWZXRlcmluYXJ5JTIwTmlnaHQlMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Stars Veterinary Night Clinic",
    "211 Hougang Street 21",
    "#01-301",
    530211,
    62809880,
    "starsveterinaryclinic.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjYzJTIyJTNFVGhlJTIwQW5pbWFsJTIwQ2xpbmljJTIwUHRlJTIwTHRkJTIwKEthdG9uZyUyMEJyYW5jaCklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "The Animal Clinic Pte Ltd (Katong Branch)",
    "55 Lorong L, Telok Kurau",
    "#01-63",
    425500,
    64404767,
    "animalclinic.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY0JTIyJTNFVGhlJTIwQW5pbWFsJTIwQ2xpbmljJTIwUHRlJTIwTHRkJTIwKENsZW1lbnRpKSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "The Animal Clinic Pte Ltd (Clementi)",
    "109 Clementi Street 11",
    "#01-19",
    120109,
    67744464,
    "animalclinic.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY1JTIyJTNFVGhlJTIwQW5pbWFsJTIwRG9jdG9ycyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "The Animal Doctors",
    "Blk 108 Ang Mo Kio Ave. 4",
    "#01-94/96",
    560108,
    64514531,
    "theanimaldoctors.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY2JTIyJTNFVGhlJTIwQW5pbWFsJTIwRG9jdG9ycyUyMChUaW9uZyUyMEJhaHJ1KSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "The Animal Doctors (Tiong Bahru)",
    "11A Boon Tiong Road",
    "Next to Tiong Bahru Plaza #02-07/08",
    161011,
    62533023,
    "theanimaldoctors.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY3JTIyJTNFVGhlJTIwQ2F0JTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "The Cat Clinic",
    "109 Clementi Street 11",
    "#01-33",
    120109,
    67763450,
    ""
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY4JTIyJTNFVGhlJTIwSm95b3VzJTIwVmV0JTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "The Joyous Vet",
    "Blk 475 Choa Chu Kang Ave 3",
    "#01-30A, Sunshine Place",
    680475,
    67690304,
    "tjv.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjY5JTIyJTNFVGhlJTIwSm95b3VzJTIwVmV0JTIwKFl1YW4lMjBDaGluZyklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "The Joyous Vet (Yuan Ching)",
    "1 Yuan Ching Road",
    "#03-03",
    618640,
    "62674137 / 62674138",
    "tjv.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjcwJTIyJTNFVGhlJTIwUGV0JTIwRG9jdG9ycyUyMFZldGVyaW5hcnklMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "The Pet Doctors Veterinary Clinic",
    "3 Pandan Valley",
    "#01-311 Pandan Valley Condominium",
    597627,
    64387779,
    "petdoctors.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjcxJTIyJTNFVGhlJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUyMChIb2xsYW5kJTIwVmlsbGFnZSklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "The Veterinary Clinic (Holland Village)",
    "31A & 33A Lorong Liput",
    "",
    277742,
    64686312,
    "vetclinic.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjcyJTIyJTNFVGhlJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUyMChUYW1waW5lcyklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "The Veterinary Clinic (Tampines)",
    "476 Tampines Street 44",
    "#01-201",
    520476,
    67842048,
    "vetclinic.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjczJTIyJTNFVGhlJTIwVmlzaXRpbmclMjBWZXRzJTIwQ2xpbmljJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "The Visiting Vets Clinic",
    "9 Taman serasi",
    "#01-09",
    257720,
    64753405,
    "thevisitingvets.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjc0JTIyJTNFVG9hJTIwUGF5b2glMjBWZXRzJTIwKFRvYSUyMFBheW9oJTIwVmV0ZXJpbmFyeSUyMFN1cmdlcnkpJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
    "Toa Payoh Vets (Toa Payoh Veterinary Surgery)",
    "1002 Toa Payoh Lorong 8",
    "#01-1477",
    319074,
    62543326,
    "toapayohvets.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjc1JTIyJTNFVG93biUyMFZldHMlMjBBbmltYWwlMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Town Vets Animal Clinic",
    "22 Havelock Road",
    "#01-687",
    160022,
    62767026,
    "townvets.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjc2JTIyJTNFVW5pdGVkJTIwVmV0ZXJpbmFyeSUyMENsaW5pYyUzQyUyRmElM0UlM0MlMkZwJTNF",
    "United Veterinary Clinic",
    "107 Ang Mo Kio Ave 4",
    "#01-148",
    560107,
    64556880,
    "unitedvetclinic.com"
  ],
  [
    "Vet Central",
    "Vet Central",
    "Blk 69, Lorong 4 Toa Payoh",
    "#01-357",
    310069,
    66358646,
    "vetcentral.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjc4JTIyJTNFVmV0ZXJpbmFyeSUyMEVtZXJnZW5jeSUyMGFuZCUyMFNwZWNpYWx0eSUyMEhvc3BpdGFsJTIwKFZFUyklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Veterinary Emergency and Specialty Hospital (VES)",
    "2-14 Rochdale Road",
    "",
    535815,
    65817028,
    "veshospital.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjc5JTIyJTNFVmV0cyUyMGZvciUyMExpZmUlMjBBbmltYWwlMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Vets for Life Animal Clinic",
    "491 River Valley Road",
    "Valley Point #01-05/06",
    248371,
    67320273,
    "vetsforlife.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjgwJTIyJTNFVmV0cyUyMGZvciUyMExpZmUlMjBBbmltYWwlMjBDbGluaWMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Vets for Life Animal Clinic",
    "330B Tanjong Katong Road",
    "",
    437106,
    63488346,
    "vetsforlife.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjgxJTIyJTNFVmV0cyUyMEZvciUyMFBldHMlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Vets For Pets",
    "519 Jurong West Street 52,",
    "#01-157",
    640519,
    65691627,
    "vetsforpetsclinic.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjgyJTIyJTNFVmV0JTIwUHJhY3RpY2UlMjBQdGUlMjBMdGQlM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Vet Practice Pte Ltd",
    "21 Lorong Kilat",
    "#01-04/05",
    598123,
    64621757,
    "vetpractice.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjgzJTIyJTNFVmV0JTIwUHJhY3RpY2UlMjBQdGUlMjBMdGQlMjAoSG9sbGFuZCUyMEJyYW5jaCklM0MlMkZhJTNFJTNDJTJGcCUzRQ==",
    "Vet Practice Pte Ltd (Holland Branch)",
    "31 Holland Close",
    "#01-219",
    270031,
    67785285,
    "vetpractice.com.sg"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjg0JTIyJTNFV2VzdCUyMENvYXN0JTIwVmV0Y2FyZSUzQyUyRmElM0UlM0MlMkZwJTNF",
    "West Coast Vetcare",
    "612 Clementi West Street 1",
    "#01-300",
    120612,
    67777423,
    "westcoast-vetcare.com"
  ],
  [
    "!iwt:JTNDcCUzRSUzQ2ElMjBocmVmJTNEJTIyaHR0cHMlM0ElMkYlMkZ2ZXRuZXIuaGVyb2t1YXBwLmNvbSUyRnZldF9wcm9maWxlcyUyRjg1JTIyJTNFV29vZGdyb3ZlJTIwVmV0ZXJpbmFyeSUyMFNlcnZpY2VzJTNDJTJGYSUzRSUzQyUyRnAlM0U=",
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

  result = JSON.load(open("https://developers.onemap.sg/commonapi/search?searchVal=#{vet[4]}&returnGeom=Y&getAddrDetails=Y"))
  vetLat = result["results"][0]["LATITUDE"]
  vetLong = result["results"][0]["LONGITUDE"]
  address = result["results"][0]["ADDRESS"]
  VetProfile.create(
    clinic_name: vet[1],
    address: address,
    unit: vet[3],
    postalcode: vet[4],
    phone: vet[5],
    website: vet[6],
    vetLat: vetLat,
    vetLong: vetLong,
    popupdetails: vet[0],
    vet_id: Vet.last.id
  )
end
