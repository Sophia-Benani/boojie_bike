class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    renter = @bike.user_id
    @user = User.find(renter)
  end
end
