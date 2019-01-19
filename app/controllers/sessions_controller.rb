class SessionsController < ApplicationController
  skip_before_action :redirect_if_not

  def signin
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to root_path
    else
      redirect_to signin_session_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
