Rails.application.routes.draw do
  root 'home#index'

  resources :bucketlists do
    resources :items
  end

  devise_for :users

end
