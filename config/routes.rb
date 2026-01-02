Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "static_pages#top"
  get "favorites", to: "favorites#index", as: "favorites"
  get "about_listener", to: "static_pages#about", as: "about_listener"
  get "feature", to: "static_pages#feature", as: "feature"
  get "profile", to: "static_pages#profile"

  resource :user, only: [] do
    get   :edit_profile
    patch :update_profile
    get   :edit_password
    patch :update_password
  end
  resources :vocabularies, only: [:index] do
    collection do
      get :memorization   # 暗記カード画面
      get :level
      get :clear          # クリア画面を追加
    end
  end
  resources :textbooks, only: [:index, :show] do
    resources :chapters, only: [:show] do
      resources :audios, only: [:show] do
        resource :favorite, only: [:index, :create, :destroy], controller: 'favorites'
      end
    end
  end

end
