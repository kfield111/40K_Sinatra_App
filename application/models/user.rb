class User < ActiveRecord::Base

  has_secure_password
  has_many :armies
  has_many :units, through: :armies

  validates :username, :uniqueness => true

  def self.authenticate(params)
    user = User.find_by_name(params[:username])
    (user && user.password == params[:password]) ? user : nil
  end

end