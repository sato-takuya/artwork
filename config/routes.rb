Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trends#index'

  devise_scope :user do
    #プロフィール編集画面へ
    get 'user_edit', to: 'users/registrations#user_edit', as: 'user_edit'
    #プロフィール更新画面へ
    patch 'user_update', to: 'users/registrations#user_update', as: 'user_update'
  end

  get '/artworks',to:'artworks#index'
  get '/:id' ,to: 'groups#index', param: :nickname
  resources :audios,:except => :show
  resources :videos,:except => :show
  resources :members,:except => :show
  get 'audios/:id',to:'audios#show', param: :nickname
  get 'videos/:id',to:'videos#show', param: :nickname
  get 'members/:id',to:'members#show', param: :nickname



  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
end
