module Profile
  class BikesController < ApplicationController
    def index
      @user = current_user.id
      @bikes = Bike.where(user_id: @user)
     
    end
  end
end
