Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :player
  namespace :player do
    get :show
  end

  get '/' => redirect("/team")

  resources :team
  namespace :player do
    get :show
  end

  resources :match
end
