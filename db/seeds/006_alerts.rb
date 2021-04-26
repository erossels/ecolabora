5.times do |i|
  Alert.create!(
    user_id: i + 1,
    content: Faker::Lorem.word
  )
end
