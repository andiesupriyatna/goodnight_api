users = [
  { name: 'JohnDoe' },
  { name: 'JaneDoe' },
  { name: 'SamSmith' }
]

users.each do |user_data|
  User.create!(user_data)
end
