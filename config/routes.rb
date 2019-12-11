Rails.application.routes.draw do
  # VERB PATH, to: 'CONTROLLER#ACTION'
  get 'new', to: 'games#new', as: :new
  # get 'score', to: 'games#score'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'score', to: 'games#score', as: :score
end
