class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
    @reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to  user_path(current_user)
  end

end
