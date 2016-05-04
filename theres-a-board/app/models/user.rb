class User < ActiveRecord::Base
  has_secure_password

  validates :full_name, :email, presence: true
end
