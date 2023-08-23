class BookingsController < ApplicationController

  def index
   @bike = Bike.find(params[:bike_id])
   @bookings = @bike.bookings
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.bike_id = params[:bike_id]
    if @booking.save
      redirect_to bike_path(@booking.bike), notice: 'Réservation créée'
    else
      redirect_to bike_path(@booking.bike)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
  end
end
