Hector::Application.routes.draw do

  get "dropbox/authorize"
  get "dropbox/authorized_callback"
  get "dropbox/create_user_and_return_home"
  devise_for :users

  root 'dropbox#authorize'
end
