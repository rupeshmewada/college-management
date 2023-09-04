class Department < ApplicationRecord
  has_many :faculties
  has_many :courses
end
