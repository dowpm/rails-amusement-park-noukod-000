class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_loging?
  before_action :redirect_if_not, except: [:home]
  before_action :is_loging?, only: :home

  def home
    puts 'home action is called----->'
    # binding.pry
  end

  def is_loging?
    !!current_user
    # binding.pry
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_if_not
    redirect_to root_path unless is_loging?
  end
end
