class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(content: params[:content], user: User.find(53), gossip: Gossip.find(params[:gossip_id]))

        if @comment.save
            redirect_to gossip_path(id: Gossip.find(params[:gossip_id])
        else 
            render new_gossip_comment_path
        end


    end

    def edit

    end

    def update

    end


    def destroy

    end


end
