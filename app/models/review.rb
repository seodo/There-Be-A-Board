class Review < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :appointment
  validates :body, :rating, presence: true
end
