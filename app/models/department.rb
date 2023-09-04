class Department < ApplicationRecord

  has_many :faculties
  has_many :course
  
end
