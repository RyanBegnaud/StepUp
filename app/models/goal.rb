class Goal < ApplicationRecord
    belongs_to :user 
    has_many :comments
    has_many :users, through: :comments 
    validates_presence_of :name, message: "Description can't be blank"
    validates_presence_of :goal_amount, message: "Goal Amount can't be blank"
    scope :most_recent, -> { order('created_at desc') }
end
