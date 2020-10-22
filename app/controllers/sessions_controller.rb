class SessionsController < ApplicationController 
    def new 
        @user = User.new 
    end

    def create 
        if params[:username] != "" && params[:password] != ""
            @user = User.find_by(username: params[:username]) 
            if @user 
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                @error = "No user found with those credentials"
                render 'new'
            end
        else 
            @error = "Username and Password cannot be left blank"
            render 'new'
        end
    end
end