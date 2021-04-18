Rails.application.routes.draw do
  resources :task_lists do
    resources :tasks
  end
  namespace :task_list do
    resources :tasks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
