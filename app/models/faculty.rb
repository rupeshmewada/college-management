class Faculty < ApplicationRecord
  validates :no, uniqueness: true

  belongs_to :department

  has_many :courses, through: :instructor_assignment
  has_many :instructor_assignment
end
