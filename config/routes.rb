Rails.application.routes.draw do
  devise_for :users

  namespace :home do
      get :about
      get :lookup
      get :news
      post :lookup
  end

  root to: 'home#index'
end
