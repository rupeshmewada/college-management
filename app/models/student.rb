class Student < ApplicationRecord
  # has_many :enrollments
  validates :name, acceptance: true
  validates :name ,:email ,uniqueness: true 
  validates :email ,confirmation: true 
# 
  has_many :courses, through: :enrollments
  has_many :enrollments
end
