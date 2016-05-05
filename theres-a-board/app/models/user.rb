class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :author_id

  validates :full_name, :email, presence: true
end
