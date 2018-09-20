Rails.application.routes.draw do
  resources :players
  resources :matches
  resources :teams

  get '/' => redirect("/teams")

end
