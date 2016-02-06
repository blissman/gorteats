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
    @user = current_user
    @business = @user.businesses.find(params[:id])
    if @business.update_attributes(restaurant_params)
      redirect_to manage_restaurants_path, notice: "Restaurant updated!"
    else
      render :show, notice: 'Invalid input.'
    end
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

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :price, :description, :capacity)
  end

end
