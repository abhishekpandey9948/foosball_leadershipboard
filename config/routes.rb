Rails.application.routes.draw do
  resources :nayyars
  resources :players
  resources :matches
  resources :teams

  get '/' => redirect("/teams")

end
