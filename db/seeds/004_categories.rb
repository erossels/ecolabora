5.times do |i|
  @seed = Category.create(name: 'Category_'+i.to_s)
  5.times do |j|
    @seed2 = Category.create(name: 'Category_'+i.to_s+'.'+j.to_s, category_id: @seed.id)
    5.times do |k|
      Category.create(name: 'Category_'+i.to_s+'.'+j.to_s+'.'+k.to_s, category_id: @seed2.id)
    end
  end
end