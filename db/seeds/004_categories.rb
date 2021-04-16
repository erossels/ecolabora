require 'faker'

5.times do |i|
  Category.create!(
    name: "Category_"+i.to_s,
  )
  5.times do |j|
    Category.create!(
      name: 'Category_'+i.to_s+'.'+j.to_s,
      category_id: i+1
    )
  end
end