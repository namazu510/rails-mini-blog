Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root                       :to => 'blogs#index'
  get   'blogs',             :to => 'blogs#index'
  post  'blogs',             :to => 'blogs#create'
  get   'blogs/:id',         :to => 'blogs#show'
  get   'blogs/like/:id',    :to => 'blogs#like'
  post  'blogs/:id/comment', :to => 'blogs#comment'
end
