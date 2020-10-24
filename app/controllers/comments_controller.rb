class CommentsController < ApplicationController 
    def new 
    end

    def create 
        @comment = Comment.create(comment_params)
        if @comment.save 
            redirect_to goal_path(@comment.goal_id)
        end
    end


    private 

    def comment_params 
        params.require(:comment).permit(:content, :user_id, :goal_id)
    end
end