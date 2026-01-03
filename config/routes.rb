Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root "static_pages#top"

  # 静的ページ
  get "favorites",      to: "favorites#index", as: "favorites"
  get "about_listener", to: "static_pages#about", as: "about_listener"
  get "feature",        to: "static_pages#feature", as: "feature"
  get "profile",        to: "static_pages#profile"

  # ユーザー設定
  resource :user, only: [] do
    get   :edit_profile
    patch :update_profile
    get   :edit_password
    patch :update_password
  end

  # 単語学習
  resources :vocabularies, only: [:index] do
    collection do
      get :level        # 級ごとの単語一覧
      get :memorization # 暗記
      get :clear        # クリア画面
    end
  end

  # テスト作成・表示（シリーズ単位でフラット）
  resources :tests, only: [:show, :create] do
  member do
    post :submit   # 解答送信
    get  :result   # 結果表示
  end
end

  # 教材・音声
  resources :textbooks, only: [:index, :show] do
    resources :chapters, only: [:show] do
      resources :audios, only: [:show] do
        resource :favorite, only: [:index, :create, :destroy], controller: "favorites"
      end
    end
  end
end
