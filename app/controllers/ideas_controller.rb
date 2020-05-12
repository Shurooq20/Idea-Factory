class IdeasController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]

    before_action :authorize!, only: [:edit, :update, :destroy]

    def new 

        @idea = Idea.new

    end

    def create 
        idea_params = params.require(:idea).permit(:title, :description)
        @idea = Idea.new idea_params
        @idea.user = current_user
        if @idea.save 
            redirect_to @idea
        else
            render :new 
        end
    end
    ####################

    def edit 
        @idea = Idea.find params[:id]
    end

    def update
        idea_params = params.require(:idea).permit(:title, :description)
        @idea = Idea.find params[:id]
        if @idea.update idea_params
            redirect_to @idea
        else
            render :edit
        end
    end
    ####################

    def show

            @idea = Idea.find params[:id]
            @review = Review.new
            @reviews = @idea.reviews.order(created_at: :DESC)
            @like = @idea.likes.find_by(user: current_user)
        
    end
    ####################

    def index
        @idea = Idea.order(created_at: :DESC)
    end
    ####################

    def destroy
        @idea = Idea.find(params[:id])
        @idea.destroy
        redirect_to ideas_path
    end
    
    def authorize! 
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, Idea)
    end

end
