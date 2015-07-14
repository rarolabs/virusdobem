Rails.application.routes.draw do
  root to: "home#index"
  devise_for :usuarios

  resources :usuarios, only: [:edit,:update]

  # Routes for RaroCrud
  get '/crud/:model' => "crud#index"
  get '/crud/:model/:id/edit' => "crud#edit"
  delete '/crud/:model/:id/destroy' => "crud#destroy"
  get '/crud/:model/new' => "crud#new"
  get '/crud/:model/query' => "crud#query"
  post '/crud/:model/create' => "crud#create"
  patch '/crud/:model/:id/create' => "crud#create"
  get '/crud/:model/:id/acao/:acao' => "crud#action"
  get '/crud/:model/:id' => "crud#show"

  resources :permissoes, only: [:create]
  resources :instituicoes, only: [:index]
  
  namespace :api do
    resources :cidades, only: [] do
      collection do
        get 'busca'
      end
    end
    resources :instituicoes, only: [:index, :show] do
      collection do
        post 'busca'
      end
    end
    resources :dispositvos, only: [:create] do
      member do
        post 'quero_ser_voluntario'
      end
    end
  end
end