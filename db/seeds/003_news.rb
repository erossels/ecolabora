require 'faker'
10.times do |i|
  News.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs(number: 2, supplemental: true),
    admin_id: 0
  )
end