class User < ApplicationRecord
    has_secure_password
    serialize :current_goals, Array 
    serialize :goals_completed, Array
    has_many :goals 
    has_many :comments, through: :goals   
    validates :first_name, length: {minimum: 2, message: "First name must contain at least 2 characters"}
    validates :last_name, length: {minimum: 2, message: "Last name must contain at least 2 characters"}
    validates :username, uniqueness: true 
end
