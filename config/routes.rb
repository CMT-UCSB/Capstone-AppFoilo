Rails.application.routes.draw do
  devise_for :managers
  resources :notes
  resources :employees
  # resources :mood_responses, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "react_home#reactHome"
  get '/account' => 'pages#account', :as => :manager_root
  get 'surveys/success' => 'surveys#success', as: :surveys_success
  get 'surveys/:id/:employeeid' => 'surveys#show'
  post 'surveys/:id/:employeeid/mood_responses' => 'mood_responses#create', as: :surveys_mood_responses
  post 'surveys/:id/:employeeid/open_ended_responses' => 'open_ended_responses#create', as: :surveys_open_ended_responses
  get 'surveys/create' => 'surveys#create'
  post 'pages/send_emails'


  # make all undefined path to get reactHome
  get '*path', to: 'react_home#reactHome', via: :all

  post '/surveys/create'

end
