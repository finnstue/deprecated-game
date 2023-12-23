Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Route for game creation
  post 'games', to: 'games#create'

  # Route for joining a game
  post 'games/join', to: 'games#join', as: 'join_game'

  # Route for the game lobby
  get 'games/:id/lobby', to: 'games#lobby', as: 'game_lobby'

  # Route to start the game
  post 'games/:id/start', to: 'games#start', as: 'start_game'

  # Route to the game play view
  get 'games/:id/play', to: 'games#play', as: 'game_play'

  # Set the root route to the GamesController's new action
  root 'games#new'

  # config/routes.rb
  get '/games/next_question', to: 'games#next_question'

  resources :games do
    post 'submit_answer', on: :member
  end
end

