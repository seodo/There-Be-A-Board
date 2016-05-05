class Review < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :mentor, class_name: 'User'
  belongs_to :appointment
end
