Rails.application.routes.draw do
  namespace :api do
    resources :comments, only: %i[index create show] do
      collection do
      end
    end
  end
end
