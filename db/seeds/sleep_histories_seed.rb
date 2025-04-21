User.all.each do |user|
  SleepHistory.create!(
    user_id: user.id,
    clock_in: Faker::Time.backward(days: 30, period: :evening),
    clock_out: Faker::Time.backward(days: 29, period: :morning)
  )
end

puts "Sleep History has been seeded."