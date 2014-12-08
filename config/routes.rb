Rails.application.routes.draw do
  resources :packages

  get '/packages', to: 'packages#index' #restful

  # bot will be incorporated into one link for the 
  # process
  get '/update', to: 'packages#create' 

  #root
  root to: 'packages#index'

end
