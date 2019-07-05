Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trends#index'
  devise_scope :user do
    #プロフィール編集画面へ
    get 'user_edit', to: 'users/registrations#user_edit', as: 'user_edit'
    #プロフィール更新画面へ
    patch 'user_update', to: 'users/registrations#user_update', as: 'user_update'
  end

  get '/question',to: 'docs#question'
  get '/unsubscribe',to: 'docs#unsubscribe'
  get '/terms',to: 'docs#terms'
  get '/privacy_policy',to: 'docs#privacy_policy'

  resources :audios,:except => :index,param: :public_uid
  resources :videos,:except => :index,param: :public_uid
  resources :members,:except => :show

  get 'audios/:id/all',to:'audios#index', param: :nickname
  get 'videos/:id/all',to:'videos#index', param: :nickname
  get 'members/:id',to:'members#show', param: :nickname

  get '/artworks',to:'artworks#index'
  get '/:id' ,to: 'groups#index', param: :nickname



  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    delete '/users/:id' => 'users/registrations#destroy'
  end
end
