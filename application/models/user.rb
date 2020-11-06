class User < ActiveRecord::Base
  has_many :armies
  has_many :units, through: :armies

end
