Rails.application.routes.draw do
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

namespace :admin do
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :vegetainable_reviews, only: [:show, :destroy]
  end

end


scope module: :user do
  root to: 'homes#top'
  resources :vegetainable_reviews, only: [:index, :new, :show, :create, :edit, :update]
  delete '/vegetainable_review/:id' => "vegetainable_reviews#destroy", as: 'destroy_vegetainable_review'

  resources :comment, only: [:create, :edit, :update, :destroy]
  resource :favorite, only: [:create, :destroy]

  # get 'vegetainable_review/:id/favorite/new' => "favorites#new", as: 'new_favorite'
  # post 'vegetainable_review/:id/favorite/new' => "favorites#new", as: 'favorite'
  # get '/vegetainable_review/:id/favorite/:id/edit' => "favorite#edit", as: 'edit_favorite'
  # patch '/vegetainable_review/:id/favorite/:id' => "favorite#update", as: 'update_favorite'
  # delete '/vegetainable_review/:id/favorite/:id' => "favorite#destroy", as: 'destroy_favorite'

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
