class UsersController < ApplicationController
  skip_before_action :redirect_if_not, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new users_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    # binding.pry
    redirect_to signin_session_path unless @user
  end

  private

  def users_params
    params.require(:user).permit(:name,:happiness,:tickets,:nausea,:password,:height, :admin)
  end
end
