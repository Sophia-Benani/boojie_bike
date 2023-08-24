module Profile
  class BikesController < ApplicationController
    def index
      @user = current_user.id
      @bikes = Bike.where(user_id: @user)
    end

    def destroy
      @bike = Bike.find(params[:id])
      @bike.destroy
      redirect_to profile_bikes_path
    end

    def edit
      @bike = Bike.find(params[:id])
    end

    def update
      @bike = Bike.find(params[:id])
      @bike.update(bike_params)
      redirect_to bike_path
    end

    private

    def bike_params
      params.require(:bike).permit(:name, :brand, :category, :description, :address, :accessories, :price, photos: [])
    end
  end
end
