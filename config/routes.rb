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
    get "/mypages/edit", to: "mypages#edit"
    patch "/mypages/edit", to: "mypages#update"
    get "mypages", to: "mypages#show"
    resources :reviews, only:[:show, :new, :create, :update, :destroy]
    resources :comments, only:[:create, :destroy]
    resources :movies, only:[:show] do
      collection do
        get "/search", to: 'movies#search'
      end
    end
    resources :users, only:[:show]
  end

  namespace :admin do
    root :to => 'homes#top'
    resources :movies, only:[:new, :create, :edit, :update, :destroy] do
      collection do
        get "/search", to: 'movies#search'
      end
    end
  end

end
