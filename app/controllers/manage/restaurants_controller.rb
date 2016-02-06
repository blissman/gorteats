class Manage::RestaurantsController < ApplicationController
  before_action :ensure_logged_in

  def show
    @user = current_user
    @business = @user.businesses.find(params[:id])
  end

  def new
    @business = Restaurant.new
  end

  def index
    @user = current_user
    @businesses = @user.businesses
  end

  def edit
    @user = current_user
    @business = @user.businesses.find(params[:id])
  end

  # def update
  #   @user = current_user
  #   @business = @user.businesses.find(params[:id])
  #   if @business.update_attributes(business_params)
  #     redirect_to manage_restaurants_path, notice: "Restaurant updated!"
  #   else
  #     render :show, notice: 'Invalid input.'
  #   end
  # end

  # private
  # def business_params
  #   params.require(:restaurant).permit(:name, :location, :price, :description)
  # end


end
