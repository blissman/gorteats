class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])


    @reservation = @restaurant.reservations.build

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
