class Goal < ApplicationRecord
    belongs_to :user 
    has_many :comments, through: :users 
    validates_presence_of :name, message: "Description can't be blank"
    validates_presence_of :goal_amount, message: "Goal Amount can't be blank"
end
