class ReservationsController < ApplicationController

  before_action :load_user

  def index
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to @reservation
    else
      render :edit
    end
  end

  def new
  end

  def create
  end

  def delete
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date_time)
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end
