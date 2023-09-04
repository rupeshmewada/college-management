class Faculty < ApplicationRecord
  belongs_to :department
  has_many :courses , through: :instructor_assignment 
end
