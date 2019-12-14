Rails.application.routes.draw do
  # корень сайта
  root "events#index"

  resources :events
  # Не все действия поддерживаются – только show, edit, update
  resources :users, only: [:show, :edit, :update]
end
