class ReservationsController < ApplicationController
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
    @reservation = Reservation.find(params[:id])
    @reservation.delete
  end
end
