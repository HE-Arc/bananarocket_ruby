class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def user_list
    @trips = Trip.all #where(:user_id => 'params[:id_user]')
  end

  def show
  @trip = Trip.find(params[:id])

  @stage = Stage.new
  @myStages = @trip.stages.order(:date_time).reverse_order
end
end