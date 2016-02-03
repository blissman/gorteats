class ReservationsController < ApplicationController

  before_action :load_user

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

  private
  def reservation_params
    params.require(:reservation).permit(:date_time)
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end
