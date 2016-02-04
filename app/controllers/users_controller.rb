class UsersController < ApplicationController
  def index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to restaurants_path, notice: "Sign-up Successful!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def delete
  end
end
