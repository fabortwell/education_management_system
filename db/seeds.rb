user1 = User.create!(email: 'student1@example.com', password: 'password123', password_confirmation: 'password123')
user2 = User.create!(email: 'student2@example.com', password: 'password123', password_confirmation: 'password123')
user3 = User.create!(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123')


Role.create!(user: user1, role_type: :student)
Role.create!(user: user2, role_type: :student)
Role.create!(user: user3, role_type: :super_admin)

puts "Seeded 3 users with roles"
