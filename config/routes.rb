Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  root 'welcome#index'  

  resources :users do  
    post :post_login, on: :collection
    get :post_register, on: :collection
    get :login, on: :collection
    #switch this to post instead of get
    get :logout, on: :collection
  end
  resources :contests do
    post :post_submit, on: :collection
  end
  resources :archive 
  resources :ranking
  get '/comp/:id', to: 'contest#show'
  get '/comp/', to: 'contest#index'

end
