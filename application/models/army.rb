class Army < ActiveRecord::Base

  belongs_to :users
  has_many :units


end
