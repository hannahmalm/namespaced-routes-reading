Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #stats are not something we want everyone to see - thats why only admins should have this view 
  #we need a way to group all admin things - use a scope that allows us to prefix a block of routes
  #scope 'admin', module: 'admin' do 
  #use a namespace to make this DRY
  namespace :admin do 
    resources :stats, only: [:index]
  #get '/admin/stats', to: 'stats#index'
  end 

  root 'posts#index'
end
