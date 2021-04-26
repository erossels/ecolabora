status_samples = [0,1,2]

20.times do |i|
  Purchase.create(
    user_id: i + 1,
    product_id: i + 1,
    status: status_samples.sample
  )
end
