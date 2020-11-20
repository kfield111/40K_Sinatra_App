class User < ActiveRecord::Base

  has_secure_password
  has_many :armies
  has_many :units, through: :armies

  validates :username, :uniqueness => true
  validates :username, :password, :presence => true


end
