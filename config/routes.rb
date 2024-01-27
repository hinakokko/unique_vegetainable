Rails.application.routes.draw do
  namespace :user do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/create'
    get 'users/destroy'
  end
get 'users/destroy' => "users#delete"

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords], controllers: {
  sessions: "admin/sessions"
}

# ユーザー用
# URL /users/sign_in ...
  devise_for :user, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  devise_scope :user do
  post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

namespace :admin do
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :vegetainable_reviews, only: [:show, :destroy]
  end

end

scope module: :user do
  root to: 'homes#top'
  resources :homes, only: [:show]
  resources :vegetainable_reviews, only: [:index, :new, :show, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resource :favorite, only: [:create, :destroy]
  get "search" => "searches#search"
  get 'users/my_page' => "users#mypage", as: 'my_page'
  get '/users/my_page/edit' => "users#edit", as: 'edit_my_page'
  patch '/users/my_page' => "users#update", as: 'update_my_page'
  get '/users/my_page/withdraw_confirmation' => "users#withdraw_confirmation", as: 'withdraw_confirmation_my_page'
  patch '/users/my_page/withdraw' => "users#withdraw", as: 'withdraw_my_page'

  resources :users, only: [:index, :show]

  # get 'vegetainable_review/:id/favorite/new' => "favorites#new", as: 'new_favorite'
  # post 'vegetainable_review/:id/favorite/new' => "favorites#new", as: 'favorite'
  # get '/vegetainable_review/:id/favorite/:id/edit' => "favorite#edit", as: 'edit_favorite'
  # patch '/vegetainable_review/:id/favorite/:id' => "favorite#update", as: 'update_favorite'
  # delete '/vegetainable_review/:id/favorite/:id' => "favorite#destroy", as: 'destroy_favorite'

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
