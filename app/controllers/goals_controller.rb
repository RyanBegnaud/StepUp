class GoalsController < ApplicationController 
    def new
        @goal = Goal.new  
    end 

    def create
        @goal = Goal.create(goal_params)
        @goal.user_id = current_user.id 
        binding.pry 
        if @goal.save 
            redirect_to goal_path(@goal)
        else 
            render 'new'
        end  
    end

    def show 
        @goal = Goal.find(params[:id])
    end

    private 

    def goal_params 
        params.require(:goal).permit(:name, :goal_amount, :uom)
    end
end