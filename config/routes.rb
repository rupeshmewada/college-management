Rails.application.routes.draw do
  resources :departments
  resources :courses
  resources :students
  resources :faculties
  resources :enrollments
  # end
end
