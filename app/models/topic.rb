class Topic < ActiveRecord::Base
  has_and_belongs_to_many :mentors
  has_and_belongs_to_many :appointments
end
