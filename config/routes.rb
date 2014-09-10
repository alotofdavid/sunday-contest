Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'  

  resources :users do  
    post :post_login, on: :collection
    get :post_register, on: :collection
    get :login, on: :collection
    #switch this to post instead of get
    get :logout, on: :collection
  end
  resources :contests
  resources :archive
  resources :ranking
  get '/comp/:id', to: 'competitions#show'
  get '/comps/', to: 'competitions#index'

end
