Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do 
    namespace :v1 do 
      devise_scope :user do 
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
    end 
  end
end
