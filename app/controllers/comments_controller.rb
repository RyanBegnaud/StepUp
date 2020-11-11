class CommentsController < ApplicationController 
    before_action :logged_in?, only: [:edit, :new, :create, :update, :destroy]
    before_action :comment_find, only: [:edit, :update, :destroy, :show]
    
    def new 
        @comment = Comment.new
        if params[:goal_id]
            @goal = Goal.find(params[:goal_id])
        end
    end

    def create 
        @comment = Comment.create(comment_params)
        if @comment.save 
            redirect_to goal_path(@comment.goal_id)
        end
    end

    def edit 
    end

    def update 
        @comment.update(comment_params) 
        redirect_to goal_path(@comment.goal_id)
    end

    def index
        @goal = Goal.find(params[:goal_id])
        @comments = @goal.comments
    end

    def destroy 
        @goal = @comment.goal_id
        @comment.delete 
        redirect_to goal_path(@goal)
    end

    def show 
    end

    private 

    def comment_find 
        @comment = Comment.find(params[:id])
    end

    def comment_params 
        params.require(:comment).permit(:content, :user_id, :goal_id)
    end
end