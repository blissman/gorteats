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
    @user = current_user
    if @user.businesses.create(restaurant_params)
      redirect_to manage_restaurants_path, notice: "Added RestoNamePlaceholder to your managed restaurants!"
    else
      render :new, notice: 'Invalid input.'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to  user_path(current_user)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :price, :description)
  end

end
