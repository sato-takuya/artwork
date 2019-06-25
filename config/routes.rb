Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trends#index'
  get '/artworks',to:'artworks#index'
  get '/:id' ,to: 'groups#index', param: :nickname
  resources :audios,:except => :show
  resources :videos,:except => :show
  get 'audios/:id',to:'audios#show', param: :nickname
  get 'videos/:id',to:'videos#show', param: :nickname
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
