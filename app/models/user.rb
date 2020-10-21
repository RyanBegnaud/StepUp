class User < ApplicationRecord
    has_secure_password
    serialize :current_goals, Array 
    serialize :goals_completed, Array
    has_many :goals 
    has_many :comments, through: :goals   
end
