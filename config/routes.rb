Rails.application.routes.draw do
  get 'top' => 'homes#top', as: 'top'
  get 'about' => 'homes#about', as: 'about'
  get 'search' => 'homes#search', as: 'search'
  get 'users/mypage' => 'users#mypage', as: 'mypage'
  get 'users/graph' => 'users#graph', as: 'graph'
  post 'guest_sign_in', to: 'homes#new_guest'

  root to: 'homes#top'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show edit update]
  resources :diaries do
    resources :diary_comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end
  resources :teams do
    resources :requests, only: %i[new index create show destroy update]
  end
  resources :team_members, only: %i[new index create show]
end
