Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "static_pages#top"
  get "favorites", to: "favorites#index", as: "favorites"
  get "about_listener", to: "static_pages#about"
  get "profile", to: "static_pages#profile"

  resource :user, only: [] do
    get   :edit_profile
    patch :update_profile
    get   :edit_password
    patch :update_password
  end
  resources :textbooks, only: [:index, :show] do
    resources :chapters, only: [:show] do
      resources :audios, only: [:show] do
        resource :favorite, only: [:index, :create, :destroy], controller: 'favorites'
      end
    end
  end

end
