Rails.application.routes.draw do

  get 'top' => 'homes#top', as: 'top'
  get 'about' => 'homes#about', as: 'about'
  get 'search' => 'homes#search', as: 'search'
  get 'users/mypage' => 'users#mypage', as: 'mypage'
  get 'users/graph' => 'users#graph', as: 'graph'

  root to: 'homes#top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update]
  resources :diaries do
    resources :diary_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :teams do
    resources :requests, only: [:new, :index, :create, :show, :destroy]
  end
  resources :team_members, only: [:new, :index, :create, :show]
  resources :teams, only: [:new, :create, :edit, :update, :show]

end
