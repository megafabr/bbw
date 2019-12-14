Rails.application.routes.draw do
  # корень сайта
  root "events#index"

  resources :events
end
