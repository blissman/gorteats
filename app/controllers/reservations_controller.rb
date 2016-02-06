  class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations.all
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

  def create
    @reservation = Reservation.new(
      party_size: reservation_params[:party_size],
      date_time: reservation_params[:date_time],
      user: current_user,
      restaurant_id: params[:restaurant_id]
    )

    if @reservation.save
      redirect_to user_path(current_user)
    else
      render 'restaurant/show'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to  user_path(current_user)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date_time, :party_size)
  end

end
