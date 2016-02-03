class RestaurantsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def delete
        @restaurant = Restaurant.find(params[:id])
        @restaurant.delete
        redirect_to restaurants_path
  end


  end
end
