Rails.application.routes.draw do

  root to: "home#index"

  get "/sign_in" => "sessions#sign_in_form", as: "sign_in"
  post "/sign_in" => "sessions#sign_in"
  delete "/sign_out" => "sessions#sign_out", as: "sign_out"

  resources :users

  resources :profiles
  get "/profiles/:id" => "profiles#upload_avatar", as: "upload_avatar"

  resources :posts do
    resources :comments
  end
  get "/posts/:user_id/posts" => "posts#posts_by_author", as: "posts_by_author"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
