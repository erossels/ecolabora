require 'faker'
10.times do |i|
  News.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs(number: 2, supplemental: true),
    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK-uZSKzp-WZRL-oA0XsrpZgdWiyYIIgdBoA&usqp=CAU",
    admin_id: 1
  )
end