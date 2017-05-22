Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'highscore/index'

  resources :highscores
  resources :users

  root 'highscore#index'
end
