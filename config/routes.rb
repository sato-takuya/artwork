Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'trends#index'
  get '/:id/about',to: 'groups#about'
  get '/:id' ,to: 'groups#index', param: :nickname
end
