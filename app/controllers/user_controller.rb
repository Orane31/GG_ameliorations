class UserController < ApplicationController
  def show
    params[:user] = User.find(params[:id])
  end
end
