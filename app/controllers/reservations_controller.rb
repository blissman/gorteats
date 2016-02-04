class ReservationsController < ApplicationController

  before_action :load_user

  def index
    @reservations = current_user.reservations.all
  end

  def show
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to user_path(current_user)
    else
      render 'restaurant/show'
    end
  end

  def delete
    @reservation = Reservation.find(params[:id])
    @reservation.delete
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date_time, :party_size)
  end

end
