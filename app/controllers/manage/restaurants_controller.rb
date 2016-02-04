class Manage::RestaurantsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @user = current_user
    @businesses = @user.businesses
  end

  def show
    @user = current_user
    @business = @user.businesses.find(params[:id])
  end

end
