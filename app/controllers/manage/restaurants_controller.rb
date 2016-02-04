class Manage::RestaurantsController < ApplicationController
  before_action :ensure_logged_in

  def index
    @user = current_user
    @businesses = @user.businesses
  end

  def edit
    @business = @user.business.find(:id)
  end
end
