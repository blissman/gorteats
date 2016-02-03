class ReservationsController < ApplicationController
  def index
  end

  def show
    @reservation = Reservation.find(params[:id])
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
