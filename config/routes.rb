Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top', as: 'top'
  get 'about' => 'homes#about', as: 'about'
  get 'search' => 'homes#search', as: 'search'
  get 'users/mypage' => 'users#show', as: 'mypage'
  get 'users/graph' => 'users#graph', as: 'graph'


  resources :diarys
  resources :teams
  resources :team_members, only: [:new, :index, :create, :show]
  resources :requests, only: [:new, :index, :create, :show]
end
