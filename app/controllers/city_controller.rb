class CityController < ApplicationController
  def show
    params[:id] = City.find(params[:id])
  end
end
