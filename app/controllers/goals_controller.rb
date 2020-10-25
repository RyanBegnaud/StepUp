class GoalsController < ApplicationController 
    
    def index 
        if params[:user_id]
            @goals = User.find(params[:user_id]).goals
            @comment = Comment.new  
        else 
            @goals = Goal.all 
            @comment = Comment.new 
        end
    end 

    def new
        @goal = Goal.new  
    end 

    def edit 
        @goal = Goal.find(params[:id])
    end 

    def update 
        @goal = Goal.find(params[:id])
        @goal.update(goal_params)
        if @goal.save 
            redirect_to goal_path(@goal)
        else 
            render 'edit'
        end
    end

    def create
        @goal = Goal.create(goal_params)
        @goal.user_id = current_user.id 
      
        if @goal.save 
            redirect_to goal_path(@goal)
        else 
            render 'new'
        end  
    end

    def show 
        if Goal.find_by(id: params[:id])
            @goal = Goal.find(params[:id])  
            @comment = Comment.new
        else 
            redirect_to '/'
        end 
    end

    def destroy
        @goal = Goal.find(params[:id])  
        redirect_to goals_path
    end
    private 

    def goal_params 
        params.require(:goal).permit(:name, :goal_amount, :uom)
    end
end