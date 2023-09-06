class Course < ApplicationRecord

  belongs_to :department
  has_many :students, through: :enrollments

  has_one :faculty, :through => :instructor_assignment
  has_one :instructor_assignment
end
