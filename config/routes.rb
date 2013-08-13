ArtSocnet::Application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    get 'signup',                          to: 'registrations#new'
  end
  resources :users, only: [:index, :show, :edit]

  root "static_pages#home"
  get '/help',                            to: 'static_pages#help'
  get '/contacts',                        to: 'static_pages#contacts'

  #namespace :after_signup do
    get '/after_signup/step_2',           to: 'after_signup#step_2'
    patch '/after_signup/step_2_update',  to: 'after_signup#step_2_update'
    #match '/after_signup/step_2_update',  to: 'after_signup#step_2_update', via: [:patch, :put]
    #get '/step_2_update',  to: 'after_signup#step_2_update'
  #end

  #match 'signup',        to: 'users#new', via: [:get]

  # The priority is based upon order of creation: first created -> highest priority.
  # Se how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
