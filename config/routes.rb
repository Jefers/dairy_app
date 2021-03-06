DairyApp::Application.routes.draw do

  resources :announcements

  SSL_PROTO__ = 'http' unless defined?(SSL_PROTO__)
  scope :constraints => { :protocol => SSL_PROTO__ } do
    # All your SSL routes.
    devise_for :customers #, :controllers => { :registrations => "my_registrations" }
    resources :customers
  end

  match "customers(/*path)",
        :to => redirect { |params, request|
                          "http://" + request.host_with_port +
                                       request.fullpath
                        }

    match 'customer_holidays/old' => 'customer_holidays#old', :as => :old_holidays
    resources :customer_holidays
    resources :quicknotes
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

    resources :suppliers

    # resources :store
    scope 'products' do
      match '/checkout'         => 'products#checkout'
      match '/empty_cart'       => 'products#empty_cart'
      match '/add_to_cart'      => 'products#add_to_cart'
      match '/remove_from_cart' => 'products#remove_from_cart'
      match '/save_order'       => 'products#save_order'
    end

    # match 'products/cart' => 'store#cart', :as => :cart

    match 'orders/my_orders' => 'orders#my_orders', :as => :my_orders

    # resources :orders
    # resources :line_items

    resources :orders do
      resources :line_items
    end


    # get "users/new"
    # match '/signup',     :to => 'users#new'
    match '/merchant',     :to => 'pages#merchant'
    match '/pantry',       :to => 'pages#pantry'
    match '/help_holiday', :to => 'pages#help_holiday'
    match '/help_order',   :to => 'pages#help_order'
    match '/contact',      :to => 'pages#contact'
    match '/about',        :to => 'pages#about'
    match '/help',         :to => 'pages#help'
    match '/disclaimer',   :to => 'pages#disclaimer'
    match '/privacy',      :to => 'pages#privacy'
    match '/security',     :to => 'pages#security'
    match '/news',         :to => 'pages#news'
    match '/fun',          :to => 'pages#fun'
    match '/home',         :to => 'pages#home'
    match '/quick_list',   :to => 'products#quick_list'

    root :to => "pages#home"


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
