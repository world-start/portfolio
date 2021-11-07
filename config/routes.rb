Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions:      'user/sessions',
    passwords:     'user/passwords',
    registrations: 'user/registrations'
  }

  devise_for :admin, controllers: {
    sessions:       'admin/sessions',
    passwords:      'admin/passwords',
    # registrations:  'admin/registrations'
  }

  scope module: :user do
    root :to => 'homes#top'
    get "/homes/about" =>"homes#about"
    resources :registrations, only:[:new, :create]
    get "mypage", to: "mypages#mypage"
    get "mypages", to: "mypages#show"
    resources :reviews, only:[:show, :new, :create, :update, :destroy]
    resources :comments, only:[:new, :create]
    resources :movies, only:[:show]
    resources :users, only:[:show]
  end

  namespace :admin do
    root :to => 'homes#top'
    resources :movies, only:[:new, :create, :destroy]
  end

  get 'search' => 'movies#search'
end
