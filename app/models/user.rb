class User < ApplicationRecord
    has_secure_password
    serialize :current_goals, Array 
    serialize :goals_completed, Array
    has_many :goals 
    has_many :comments, through: :goals   
    validates :first_name, length: {minimum: 2, message: "First name must contain at least 2 characters"}
    validates :last_name, length: {minimum: 2, message: "Last name must contain at least 2 characters"} 
    validates :username, uniqueness:  { message: "A user is already registered with that Username."}
    validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => 'Please enter a valid email address.'
    validates :email, uniqueness: { message: 'A user already has that email.' }
    validates :password, length: {in: 6..20, message: "Password must be at least 6 characters."}
   
end
