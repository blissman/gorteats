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
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(
      party_size: reservation_params[:party_size],
      date_time: reservation_params[:date_time],
      user: current_user,
      restaurant: @restaurant
    )

    if (@reservation.party_size != 0) && @reservation.party_size < (@restaurant.capacity - @restauraunt.reservations.sum(:party_size) + @reservation.party_size)

      if @reservation.save
        redirect_to user_path(current_user)
      else
        render 'restaurant/show'
      end

    else
      flash[:notice] = "Sorry, the restauraunt does not currently have enough space for your party of #{@reservation.party_size}. Total capacity is #{@restaurant.capacity}. Please try again later."
      render :new
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
