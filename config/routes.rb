Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "static_pages#top"
  get "favorites", to: "favorites#index", as: "favorites"

  resources :textbooks, only: [:index, :show] do
    resources :chapters, only: [:show] do
      resources :audios, only: [:show] do
        resource :favorite, only: [:create, :destroy], controller: 'favorites'
      end
    end
  end

end
