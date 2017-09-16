Rails.application.routes.draw do



  get 'todos', to: 'todo#index'
  get   'todoshow',      to: 'todo#show'

  root 'todo#show'
  post   'todocreate',      to: 'todo#create'
  delete  'tododelete:id',  to: 'todo#destroy', as: 'tododelete'
  patch  'todoupdate:id',  to: 'todo#update', as: 'todoupdate'
  post   'todoedit:id',   to: 'todo#edit',     as: 'todoedit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
