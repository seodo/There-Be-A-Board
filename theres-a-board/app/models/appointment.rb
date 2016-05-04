class Appointment < ActiveRecord::Base
  belongs_to :mentor, class_name: 'User'
  belongs_to :student, class_name: 'User'
  has_many :reviews
  has_and_belongs_to_many :topics

  validates :start_time, :length, :phase, presence: true
end
