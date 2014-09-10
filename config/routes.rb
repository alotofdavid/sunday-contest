Rails.application.routes.draw do
  resources :users do  
    post :post_login, on: :collection
    get :post_register, on: :collection
    get :login, on: :collection
    #switch this to post instead of get
    get :logout, on: :collection
  end
end
