Rails.application.routes.draw do
  mount API::Base, at: "/"
  root 'home#index'

end
