class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all
  end

  def new
    @gossips = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(53))
    @gossip.user = current_user

    if @gossip.save
#      @message = "The super potin was succesfully saved !"
      flash[:success] = "Le livre a été mis à jour."
      redirect_to index_path
    else
      @problem = true 
      render new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
      if @gossip.update(gossip_params)
        redirect_to gossip_path
      else
        @invalid =  true
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to index_path

  end

end
