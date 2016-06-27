Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'store/index'

  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # See how your routes lay out with "rate routes"
  #
  # # You can have the root of your site routed with "root"
  root 'store#index', as: 'store'
end
