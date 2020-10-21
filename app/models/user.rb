class User < ApplicationRecord
    has_many :goals 
    has_many :comments, through: :goals
    
end
