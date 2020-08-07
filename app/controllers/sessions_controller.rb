require 'bcrypt'

class SessionsController < ApplicationController
  def new
  
  end


  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
      user = User.find_by(email: params[:email])
    
      # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = " Welcome #{user.first_name} ! Here are all the hot gossips you may have missed !"
        redirect_to :controller => 'static_pages', :action => 'index'
      else
        @problem = true
        flash.now[:danger] = 'Error password or mail'
        render 'new'
      end
  end


  def destroy
    session.delete(:user_id)
    flash[:success] = "Bye bye"
    redirect_to :controller => 'static_pages', :action => 'index'
  end
end
