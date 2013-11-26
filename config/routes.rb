Hector::Application.routes.draw do
  # post "drops/create"

  resources :dropzones do
	  resources :drops
	end

  get "dropbox/authorize"
  get "dropbox/authorized_callback"
  get "dropbox/create_user_and_return_home"
  get "dropbox/index"
  get "dropbox/upload"

  devise_for :users, :controllers => { :registrations => "users/registrations" }

  root 'dropbox#index'
end
