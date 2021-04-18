ev_samples = [1, 2, 3, 4, 5]

10.times do |i|
  Evaluation.create(
    user_id: i + 9,
    sale_id: i + 1,
    grade: ev_samples.sample
  )
end
