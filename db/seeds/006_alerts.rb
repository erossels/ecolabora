require 'faker'

10.times do |i|
  Alert.create(
    user_id: i + 9,
    content: Faker::Lorem.word
  )
end
