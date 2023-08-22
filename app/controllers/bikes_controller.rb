class BikesController < ApplicationController
  def index
  end

  def show
    @bike = Bike.find(params[:id])
    renter = @bike.user_id
    @user = User.find(renter)
    @booking = Booking.newe
  end
end
