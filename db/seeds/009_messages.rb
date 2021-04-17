20.times do |i|
  Chat.create(
    transaction_id: i + 1
  )
end
