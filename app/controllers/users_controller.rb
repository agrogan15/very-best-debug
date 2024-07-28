class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.username)
    else
      render :index
    end
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user.update(user_params)
      redirect_to user_path(@user.username)
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
