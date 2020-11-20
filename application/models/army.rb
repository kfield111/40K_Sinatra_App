class Army < ActiveRecord::Base

  belongs_to :user
  has_many :units

  validates :army_name, :faction, :army_point_cost, :presence => true

end
