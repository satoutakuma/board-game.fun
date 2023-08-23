Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "customers#index"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :games, only: [:index, :show, :edit, :update]
  end
  scope module: 'public' do
    root to: "homes#top"
    get 'homes/about' => "homes#about"
    resources :games do
      collection do
        get :sort_by_players_range
      end
      resource :favorites, only: [:create, :destroy]
      resources :game_comments, only: [:create, :destroy]
      resources :game_reply, only: [:create, :destroy]
    end
    resources :customers, only: [:show, :edit, :update] do
      get 'unsubscribe'
      patch 'withdraw'
    end
  end
end
