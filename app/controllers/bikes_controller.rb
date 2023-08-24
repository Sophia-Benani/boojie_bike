class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { bike: bike }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
    renter = @bike.user_id
    @user = User.find(renter)
    @booking = Booking.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user_id = current_user.id
    if @bike.save
      redirect_to bikes_path, notice: 'Bike was successfully created.'
    end
  end
end

private

def bike_params
  params.require(:bike).permit(:name, :brand, :category, :description, :address, :accessories, :price, photos: [])
end
