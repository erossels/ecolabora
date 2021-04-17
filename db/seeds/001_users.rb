# require 'faker'

# r = Random.new

# 20.times do |i|
#  User.create!(
#    email: "usuario"+i.to_s+"@correo.cl",
#    password: 123456,
#    password_confirmation: 123456,
#    first_name: Faker::Name.first_name,
#    last_name: Faker::Name.last_name, 
#    age: r.rand(10...42),
#    address: Faker::Address.street_name,
#    n_address: Faker::Address.building_number,
#    city: Faker::Address.city,
#    province: Faker::Address.state
#  )
# end