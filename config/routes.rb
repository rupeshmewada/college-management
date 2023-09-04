Rails.application.routes.draw do
  resources :departments do
    resources :courses
    resources :faculties
  end
  resources :students
  resources :enrollments
  # end
end
