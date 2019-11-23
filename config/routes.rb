Rails.application.routes.draw do
  # root url
  root to: 'pages#home'

  # home pages
  get 'home', to: 'pages#home', as: 'home'
  get 'about', to: 'pages#about', as: 'about'


  #reviews
  get 'reviews/:id/review', to: 'reviews#review', as: 'review_review'
  get 'reviews/new', to:'reviews#new', as: 'create_review'
  get 'reviews/:id', to: 'reviews#show', as: 'review'
  post 'reviews', to: 'reviews#create'


  #subscriptions
  get 'subscriptions', to: 'subscriptions#index', as: 'subscriptions'
  get 'subscriptions/buy', to:'subscriptions#buy', as: 'buy_subscription'
  post 'subscriptions/buy', to:'subscriptions#buy'
  get 'subscriptions/:id', to: 'subscriptions#show', as: 'subscription'
  delete 'subscriptions/:id', to: 'subscriptions#destroy'

  #bookstore
  get 'bookstores/:id/home', to: 'bookstores#home', as: 'bookstores_home'
  get 'bookstores', to: 'bookstores#index', as: 'bookstores'
  get 'bookstore/:id', to: 'bookstores#show', as: 'bookstore'


  # books
  get 'books', to: 'books#index', as: 'books'
  get 'books/personal_library', to: 'books#personalLibrary', as: 'personal_library'
  get 'books/new', to: 'books#new',
    as: 'new_book'
  get 'books/:book_id/reviews/new', to: 'reviews#new', as: 'new_review'  
  post 'books', to: 'books#create'
  get 'books/:id/edit', to: 'books#edit',
    as: 'edit_book'
  get 'books/:id', to: 'books#show', as: 'book'
  patch 'books/:id', to: 'books#update'
  put 'books/:id', to: 'books#update'
  delete 'books/:id', to: 'books#destroy'


  #search for book
  get 'search', to: 'searches#index', as: 'search'
  get 'buy/:id', to: 'searches#show', as: 'buy'
  get 'buy/:id/edit', to: 'searches#edit', as: 'cart'
  patch 'buy/:id', to: 'searches#update'
  put 'buy/:id', to: 'searches#update'
  get 'buy/:id/checkCouponCode', to: 'searches#checkCouponCode', as: 'check_couponCode'
  get 'profile/:id', to: 'searches#profile', as: 'profile'


  #reading challenges
  get 'reading_challenges', to: 'reading_challenges#index', as: 'reading_challenges'
  post 'reading_challenges', to: 'reading_challenges#create'  
  get 'reading_challenges/new', to: 'reading_challenges#new', as: 
  'new_reading_challenge'  
  get 'reading_challenges/:id/edit', to: 'reading_challenges#edit', as: 
  'edit_reading_challenge'
  get 'reading_challenges/:id', to: 'reading_challenges#show', as: 'reading_challenge'
  patch 'reading_challenges/:id', to: 'reading_challenges#update'
  put 'reading_challenges/:id', to: 'reading_challenges#update'
  delete 'reading_challenges/:id', to: 'reading_challenges#destroy'


  # accounts
  devise_for :accounts, controllers: {
    registrations: 'accounts/registrations'
  }
  #         new_account_session GET    /accounts/sign_in(.:format)         devise/sessions#new
  #             account_session POST   /accounts/sign_in(.:format)         devise/sessions#create
  #     destroy_account_session DELETE /accounts/sign_out(.:format)        devise/sessions#destroy
  #        new_account_password GET    /accounts/password/new(.:format)    devise/passwords#new
  #       edit_account_password GET    /accounts/password/edit(.:format)   devise/passwords#edit
  #            account_password PATCH  /accounts/password(.:format)        devise/passwords#update
  #                             PUT    /accounts/password(.:format)        devise/passwords#update
  #                             POST   /accounts/password(.:format)        devise/passwords#create
  # cancel_account_registration GET    /accounts/cancel(.:format)          devise/registrations#cancel
  #    new_account_registration GET    /accounts/sign_up(.:format)         devise/registrations#new
  #   edit_account_registration GET    /accounts/edit(.:format)            devise/registrations#edit
  #        account_registration PATCH  /accounts(.:format)                 devise/registrations#update
  #                             PUT    /accounts(.:format)                 devise/registrations#update
  #                             DELETE /accounts(.:format)                 devise/registrations#destroy
  #                             POST   /accounts(.:format)                 devise/registrations#create

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
