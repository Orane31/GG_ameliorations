class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show

    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(content: params[:content], user: current_user.id, gossip: Gossip.find(params[:gossip_id]))

        if @comment.save
            redirect_to gossip_path(id: Gossip.find(params[:gossip_id])
        else 
            render gossip_path(id: Gossip.find(params[:gossip_id])
        end


    end

    def edit

    end

    def update

    end


    def destroy

    end


end
