class Mentor < User
  has_and_belongs_to_many :topics
  has_many :appointments
end
