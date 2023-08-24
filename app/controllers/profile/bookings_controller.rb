module Profile
  class BookingsController < ApplicationController
    def index
      @user = current_user.id
      @bookings = Booking.where(user_id: @user)
    end

    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to profile_bookings_path
    end

    def edit
      @booking = Booking.find(params[:id])
    end

    def update
      @booking = Booking.find(params[:id])
      @booking.update(booking_params)
      redirect_to profile_bookings_path
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :bike_id, :user_id)
    end
  end
end
