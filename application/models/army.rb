class Army < ActiveRecord::Base
  attr_accessor :army_name, :faction, :army_point_cost


  def initialize(params)
    @army_name = params[:army_name]
    @faction = params[:faction]
    @army_point_cost = params[:army_point_cost]
  end

  belongs_to :user
  has_many :units

  validates :army_name, :faction, :army_point_cost, :presence => true

end
