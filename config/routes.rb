Rails.application.routes.draw do
  get '/wiki_books' => 'wiki_books#index'
  get '/wiki_user_info' => 'wiki_books#wiki_user_info'

  get 'dli_books/show'

  get 'dli_books/edit'

  get '/categories' => 'categories#index'
  get 'categories/:id' => 'categories#show'
  get 'homes/index'
  get '/about_us' => 'homes#about_us', as: :about_us
  get '/help' => 'homes#help'
  get '/contact' => 'homes#contact'
  get '/search' => 'books#search'
  get '/osmania' => 'homes#osmania'
  get '/dli' => 'homes#dli'
  get '/fuel' => 'homes#fuel'
  devise_for :users
  resources :fuel_words do
    resources :fuel_translations, only: [:new, :create, :edit, :update]
  end 
  resources :fuel_translations do
    member do
      get 'vote_translation'
    end
  end
# Clean below code. Use rails 4 new feature to avoide duplications
resources :publishers do
  resources :publisher_translations, only: [:new, :create, :edit, :update]
end

resources :authors do
  resources :author_translations, only: [:new, :create, :edit, :update]
end

resources :books do 
  resources :book_translations, only: [:new, :create, :edit, :update]
end
# Dli resources
# try to make it dynamic for all books
resources :dli_books do 
  resources :dli_book_translations, only: [:new, :create, :edit, :update]
end
resources :dli_publishers do
  resources :dli_publisher_translations, only: [:new, :create, :edit, :update]
end

resources :dli_authors do
  resources :dli_author_translations, only: [:new, :create, :edit, :update]
end

resources :book_translations, only: [:index, :show, :destroy]
resources :author_translations, only: [:index, :show, :destroy]
resources :publisher_translations, only: [:index, :show, :destroy]

resources :dli_book_translations, only: [:index, :show, :destroy]
resources :dli_author_translations, only: [:index, :show, :destroy]
resources :dli_publisher_translations, only: [:index, :show, :destroy]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'fuel_words#index'

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
