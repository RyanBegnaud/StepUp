class ApplicationController < ActionController::Base
    helper_method :logged_in?
    def welcome 
    end

    def logged_in?
        if session[:user_id] != nil 
            true 
        else 
            flash[:notice] = "Must be logged in to see this page!"
            redirect_to '/' 
        end
    end


    def current_user 
        user = User.find(session[:user_id])
        if user 
          user 
        else 
          nil 
        end
    end
end
