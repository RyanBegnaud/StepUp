class UsersController < ApplicationController 
    def signin
        @user = User.new 
    end

    def show 
    end

    def login
        binding.pry 
    end
end 