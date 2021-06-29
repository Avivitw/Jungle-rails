class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates_uniqueness_of :email
  validates :password, presence: { on: create }, length: { minimum: 8 }
  validates :password_confirmation, presence: { on: create }, length: { minimum: 8 }

  
end
