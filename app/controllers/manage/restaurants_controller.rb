class Manage::RestaurantsController < ApplicationController
  before_action :ensure_logged_in

  def show
    @user = current_user
    @business = @user.businesses.find(params[:id])
    @reservations = @business.reservations
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
end
