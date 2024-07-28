
class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:venue_id])
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :index
    end
  end

  def update
    @venue = Venue.find(params[:venue_id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue)
    else
      render :show
    end
  end

  def destroy
    @venue = Venue.find(params[:id_to_delete])
    @venue.destroy
    redirect_to venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :neighborhood)
  end
end
