class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = @restaurant.reservations.build
    end
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
  end
end
