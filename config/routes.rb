ArtSocnet::Application.routes.draw do

  # get "albums/new"
  # get "albums/edit"
  # get "albums/update"
  # get "albums/delete"
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    get 'signup',                          to: 'registrations#new'
  end

  #resources :users,             only: [:index, :show, :edit, :update] do
  resources :users  do
    resources :albums, shallow: true do
      resources :images
    end
  end
    
  resources :showman_types,     only: [:edit, :update]
  resources :restaurants,       only: [:edit, :update]
  resources :restaurant_types,  only: [:edit, :update]
  resources :cuisines,          only: [:edit, :update]

  root "static_pages#home"
  get '/help',                            to: 'static_pages#help'
  get '/contacts',                        to: 'static_pages#contacts'
  get '/allusers',                        to: 'static_pages#allusers' #change to index method?
  get '/allrestaurants',                  to: 'static_pages#allrestaurants'   

  #registration paths
  ##namespace :after_signup do
    get '/after_signup/step_2',                          to: 'after_signup#step_2'
    get '/after_signup/step_guest',                      to: 'after_signup#step_guest'
    get '/after_signup/step_showman',                    to: 'after_signup#step_showman'
    get '/after_signup/step_restaurant',                 to: 'after_signup#step_restaurant'
    get '/after_signup/step_restaurant_types',           to: 'after_signup#step_restaurant_types'
    get '/after_signup/step_cuisines',                   to: 'after_signup#step_cuisines'
    get '/after_signup/final_step',                      to: 'after_signup#final_step'
    patch '/after_signup/step_2_update',                 to: 'after_signup#step_2_update'
    patch '/after_signup/step_guest_update',             to: 'after_signup#step_guest_update'
    match '/after_signup/step_showman_update',           to: 'after_signup#step_showman_update',          via:[:patch, :post]
    match '/after_signup/step_restaurant_update',        to: 'after_signup#step_restaurant_update',       via:[:patch, :post]
    match '/after_signup/step_restaurant_types_update',  to: 'after_signup#step_restaurant_types_update', via:[:patch, :post]
    match '/after_signup/step_cuisines_update',          to: 'after_signup#step_cuisines_update',         via:[:patch, :post]
    match '/after_signup/final_step_update',             to: 'after_signup#final_step_update',         via:[:patch, :post]
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
