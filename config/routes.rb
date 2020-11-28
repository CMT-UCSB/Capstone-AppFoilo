Rails.application.routes.draw do
  devise_for :managers
  resources :notes
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "react_home#reactHome"
  get '/account' => 'pages#account', :as => :manager_root
  get '/survey/success' => 'survey#success'
  get '/survey/:id' => 'survey#show'
  post 'pages/send_emails'

  # make all undefined path to get reactHome
  get '*path', to: 'react_home#reactHome', via: :all
end
