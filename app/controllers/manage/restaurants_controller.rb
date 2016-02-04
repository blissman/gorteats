class Manage::RestaurantsController < ApplicationController
  def index
    @user = current_user
    # @restaurants = @user.businesses.all
  end
end
