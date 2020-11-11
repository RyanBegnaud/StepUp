class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user
    helper_method :finished_goals
    helper_method :goal_completed?

    
    def welcome 
    end

    def logged_in?
        if session[:user_id] != nil 
            true 
        else 
            flash[:notice] = "Must be logged in to see that page!"
            redirect_to '/' 
        end
    end


    def current_user 
        user = User.find_by(id: session[:user_id])
        if user 
          user 
        else 
          nil 
        end
    end


    def goal_completed?(goal)
        if goal.save && goal.goal_progress == goal.goal_amount
            goal.user.goals_completed << goal unless goal.user.goals_completed.include?(goal)
            goal.user.save
            render 'congrats'
        elsif goal.save 
            redirect_to goal_path(goal)
        else 
            render "edit"
        end
    end

    def finished_goals(user) 
        user.goals.each do |goal| 
            if goal.goal_amount == goal.goal_progress 
                user.goals_completed << goal unless user.goals_completed.include?(goal)
                user.save 
            end
        end
        user.goals_completed
    end
end
