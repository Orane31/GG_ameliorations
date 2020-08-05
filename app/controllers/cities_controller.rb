class CitiesController < ApplicationController
  def show
    params[:city] = City.find(params[:id])
  end
end
