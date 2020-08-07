require 'bcrypt'
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_town = City.find(@user.city_id)
  end

  def new
    @new_person = User.new
    @city = City.all.order(:name)
  end


  def create
 
    @new_person = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], age: params[:user][:age], email: params[:user][:email], city_id: params[:user][:city_id], password: params[:user][:password], description: params[:user][:description])

    p "==================================================================================================="
    if @new_person.save
      p "user created"

      flash[:success] = "Welcome #{@new_person.first_name} ! Now you can check all the hot gossips of THP"
      log_in(@new_person)
      redirect_to index_path

    else
      @problem = true 
      render new_user_path
    end
  end


end
