Rails.application.routes.draw do
  root to: 'home#index'

  resource :home, only: :index

  resource :mail_list, only: :create
end
