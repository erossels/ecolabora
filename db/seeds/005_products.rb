require 'faker'

r_actions = [0, 1, 2]
status_num = [0]

10.times do |i|

  4.times do |j|
    Product.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      r_action: r_actions.sample,
      status: status_num.sample,
      user_id: i + 1,
      category_id: j+1
    )
  end

end
