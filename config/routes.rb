Rails.application.routes.draw do

    resources :users do
        resources :posts do
            resources :likes, only: [:create, :destroy]
        end
    end

    resources :posts, only: [] do
        resources :likes, only: [:index]
    end

end
