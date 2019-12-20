Rails.application.routes.draw do

  # дергаем спец. девайзовский метод, который генерит все нужные ему пути
  devise_for :users

  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    # Вложенные в ресурс события ресурсы фотографий
    resources :photos, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end


