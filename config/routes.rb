Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      get 'forecast', controller: 'forecast', action: 'index'
      get 'background', controller: 'background', action: 'show'
      get 'trails', controller: 'trail', action: 'index'
    end
  end
end
