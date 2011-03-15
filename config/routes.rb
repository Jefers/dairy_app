DairyApp::Application.routes.draw do
  # get "autocomplete_searches/Index"
  # resources :autocomplete_searches, :only => [:index], :as => 'autocomplete'
# match "/foo", :to => proc {|env| [200, {}, ["Hello world"]] }
# match '/news', :to => redirect("http://www.bbc.co.uk/")
# match '/customer/:name', :to => redirect {|params| "/customer/#{params[:name].pluralize}" }
# match "/categories/show/:id", :to => "categories#index", :constraints => {:id => /\d+/}
  get 'products/autocomplete_product_name'
  resources :products

  resources :products do
    resources :line_items
  end

  resources :categories do
    resource :products do
      member do
        get :for_category
      end
    end
  end

  # resources :store
  match 'products/checkout'    => 'products#checkout'
  match 'products/empty_cart'  => 'products#empty_cart'
  match 'products/add_to_cart' => 'products#add_to_cart'
  match 'products/save_order'  => 'products#save_order'
  # match 'products/cart' => 'store#cart', :as => :cart

  resources :orders
  resources :line_items

  resources :orders do
    resources :line_items
  end
#  match 'orders/my_orders' => 'orders#my_orders', :as => :myorders

  devise_for :customers
  resources :customers

  get "users/new"
  match '/signup',     :to => 'users#new'
  match '/contact',    :to => 'pages#contact'
  match '/about',      :to => 'pages#about'
  match '/help',       :to => 'pages#help'
  match '/disclaimer', :to => 'pages#disclaimer'
  match '/privacy',    :to => 'pages#privacy'
  match '/security',   :to => 'pages#security'
  match '/news',       :to => 'pages#news'
  match '/fun',        :to => 'pages#fun'

  root :to => "products#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
