20.times do |i|
  Chat.create(
    purchase_id: i + 1
  )
end
