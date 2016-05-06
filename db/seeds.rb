User.create!(full_name: "Jackie", email: "jackie@gmail.com", password: "123", type: "Student")
User.create!(full_name: "Dan", email: "dan@gmail.com", password: "123", type: "Mentor")
User.create!(full_name: "Jon", email: "jon@gmail.com", password: "123", type: "Student")
User.create!(full_name: "Julia", email: "julia@gmail.com", password: "123", type: "Mentor")

Topic.create!(name: "Ruby")
Topic.create!(name: "JavaScript")
Topic.create!(name: "Ajax")
Topic.create!(name: "Algorithms")
Topic.create!(name: "SQL")
Topic.create!(name: "Git")
Topic.create!(name: "CRUD")


Appointment.create!(start_time: DateTime.now - 5.days, length: "30", mentor_id: 2, student_id: 1, phase: 3, topics: [Topic.find(1), Topic.find(2)])
Appointment.create!(start_time: DateTime.now - 3.days, length: "30", mentor_id: 2, student_id: 3, phase: 3, topics: [Topic.find(6), Topic.find(7), Topic.find(5)])
Appointment.create!(start_time: DateTime.now - 2.days, length: "60", mentor_id: 4, student_id: 1, phase: 2, topics: [Topic.find(1), Topic.find(2), Topic.find(3), Topic.find(4)])
Appointment.create!(start_time: DateTime.now - 1.days, length: "60", mentor_id: 4, student_id: 3, phase: 2, topics: [Topic.find(4), Topic.find(2)])

Appointment.create!(start_time: DateTime.now + 1.days, length: "60", mentor_id: 2, student_id: 1, phase: 3, topics: [Topic.find(1), Topic.find(2)])
Appointment.create!(start_time: DateTime.now + 2.days, length: "30", mentor_id: 4, student_id: 3, phase: 2, topics: [Topic.find(7), Topic.find(6)])
Appointment.create!(start_time: DateTime.now + 3.days, length: "60", mentor_id: 2, phase: 3, topics: [Topic.find(4), Topic.find(5)])
Appointment.create!(start_time: DateTime.now + 4.days, length: "30", mentor_id: 2, phase: 3, topics: [Topic.find(1), Topic.find(2), Topic.find(6)])
Appointment.create!(start_time: DateTime.now + 5.days, length: "30", mentor_id: 4, phase: 2, topics: [Topic.find(1), Topic.find(2), Topic.find(6), Topic.find(5)])
Appointment.create!(start_time: DateTime.now + 6.days, length: "30", mentor_id: 4, phase: 2, topics: [Topic.find(1), Topic.find(2), Topic.find(7)])

Review.create!(rating: "5", author_id: 1, body: "Very helpful, I really liked how you made me drive through the Word Search challenge!", appointment_id: 3)

Review.create!(rating: "4", author_id: 4, body: "You've got a great grip on the material, I would suggest going back and refactoring your old Ruby Racer challenge!", appointment_id: 3)

Review.create!(rating: "3", author_id: 1, body: "Thank you for helping me ask more specific questions on my confusion - Keep encouraging a curious environment in your sessions!", appointment_id: 1)

Review.create!(rating: "4", author_id: 2, body: "Great job asking specific questions on conditional logic, keep probing that!", appointment_id: 1)
