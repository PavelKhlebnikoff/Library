Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'genres#index'

  resources :genres do
    resources :books do
      resources :chapters
      get :upvote, on: :member
    end
    resources :audio_books do
      get :upvote, on: :member
    end
  end

end
