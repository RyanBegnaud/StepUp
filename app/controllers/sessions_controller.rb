class SessionsController < ApplicationController 
    def new 
        @user = User.new 
    end

    def create 
        if request.env['omniauth.auth']
            @user = User.find_or_create_by(email: request.env['omniauth.auth'][:info][:email], id: request.env['omniauth.auth'][:uid], first_name: request.env['omniauth.auth'][:info][:name].split[0], last_name: request.env['omniauth.auth'][:info][:name].split[1], username: request.env['omniauth.auth'][:info][:name]) 
            if @user.password == nil 
                @user.password = "#{@user.id}" 
                if @user.save && @user.authenticate(@user.password)
                    redirect_to user_path(@user)
                end
            end
        else
            @user = User.find_by(username: params[:username]) 
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else 
                flash[:notice] = "No user found with those credentials"
                render 'new'
            end
        end 
     end


     def destroy 
        session.delete :user_id
        redirect_to "/"
     end
end
