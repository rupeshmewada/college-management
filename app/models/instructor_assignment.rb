class InstructorAssignment < ApplicationRecord
  validates :course_id, uniqueness: true
  
  belongs_to :faculty
  belongs_to :course
end
