class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :is_loging? #that's mean I can call it in any views
  before_action :redirect_if_not, except: [:home]
  # before_action :is_loging?, only: :home

  def home
    puts 'home action is called----->'
    # binding.pry
  end

  def is_loging?
    puts 'is_loging? is called =======+++'
    !!current_user
    # binding.pry
    @current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def redirect_if_not
    redirect_to root_path unless is_loging?
  end
end
