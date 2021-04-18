require 'faker'

20.times do |i|
  Message.create(
    chat_id: i + 1,
    user_id: i + 9,
    content: Faker::Lorem.sentence
  )
end
