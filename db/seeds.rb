# Create users
user1 = User.find_or_create_by!(email: 'student1@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

user2 = User.find_or_create_by!(email: 'student2@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

user3 = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

# Create roles
Role.find_or_create_by!(user: user1, role_type: :student)
Role.find_or_create_by!(user: user2, role_type: :student)
Role.find_or_create_by!(user: user3, role_type: :super_admin)

# Create announcements by the super admin
Announcement.create!([
  { title: "Welcome to the Portal", content: "We're excited to have you on board! Stay tuned for updates.", user: user3 },
  { title: "Exam Schedule Update", content: "Midterm exams will start from March 15th. Check your timetable.", user: user3 },
  { title: "New Course Added", content: "A new AI and Machine Learning course has been introduced. Enroll now!", user: user3 },
  { title: "Fee Payment Deadline", content: "The last date for fee payment is February 28th. Ensure timely payments.", user: user3 }
])

puts "data seeded"
