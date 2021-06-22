Rails.application.routes.draw do
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  get "/bienvenida", to: "home#index"  #link apunta al controlador home y accion index

  root to:"home#index"
  get "/articles/user/:user_id", to: "articles#from_author"


  resources :articles do
    get "/user/:user_id", to: "articles#from_author", on: :collection
  end
  # get "articles", to: "articles#index"
  # get "/articles/new", to: "articles#new", as: :new_articles
  # get "/articles/:id", to: "articles#show"
  # get "/articles/:id/edit", to: "articles#edit"
  # patch "/articles/:id", to: "articles#update", as: :article
  # delete "/articles/:id", to: "articles#delete"
  # post "articles", to:"articles#create"

end
