class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def edit
  end

  def new
    @attraction = Attraction.new
  end

  def create
    attraction = Attraction.new attraction_params

    if attraction.save
      flash[:message] = 'Attraction successfully added'
      redirect_to attraction
    else
      flash.now[:alert] = 'Fail'
      redirect_to new_attraction_path
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      redirect_to :edit
    end
  end


  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
