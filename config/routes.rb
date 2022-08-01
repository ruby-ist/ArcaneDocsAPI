Rails.application.routes.draw do

    resources :users do
        resources :posts do
            resources :likes, only: %i[ create destroy ]
            resources :shares, only: %i[ index create destroy ]
        end

        namespace :received do
            resources :posts, only: %i[ index ]
        end
    end

    resources :posts, only: [] do
        resources :likes, only: %i[ index ]
    end

end
