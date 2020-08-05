class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    params[:gossip] = Gossip.find(params[:id])
  end

  def new
    @gossips = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.find(22))
# J'ai créé un user anonymous, son id est le 21, du coup le new gossip aura toutjours le user 22 pour l'instant.

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
  end

  def update
  end

  def destroy
  end
end
