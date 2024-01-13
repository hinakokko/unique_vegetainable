Rails.application.routes.draw do
# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords], controllers: {
  sessions: "admin/sessions"
}

# ユーザー用
# URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

namespace :admin do
  root to: "homes#top"
end

scope module: :user do
  root to: 'homes#top'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
