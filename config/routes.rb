Rails.application.routes.draw do
  root to: 'tasks#index'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'settings', to: 'users#edit'
  patch 'settings', to: 'users#update'
  patch 'change', to: 'users#newpass'
  delete 'destroy', to: 'users#destroy'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  resources :tasks
  #get 'task_search', to: 'tasks#search'
  delete 'destroy_all', to: 'tasks#destroy_all'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


# root_path	GET	/	
# users#show

# signup_path	GET	/signup(.:format)	
# users#new

# POST	/signup(.:format)	
# users#create

# signin_path	GET	/signin(.:format)	
# sessions#new

# POST	/signin(.:format)	
# sessions#create

# signout_path	DELETE	/signout(.:format)	
# sessions#destroy

# tasks_path	GET	/tasks(.:format)	
# tasks#index

# POST	/tasks(.:format)	
# tasks#create

# new_task_path	GET	/tasks/new(.:format)	
# tasks#new

# edit_task_path	GET	/tasks/:id/edit(.:format)	
# tasks#edit

# task_path	GET	/tasks/:id(.:format)	
# tasks#show

# PATCH	/tasks/:id(.:format)	
# tasks#update

# PUT	/tasks/:id(.:format)	
# tasks#update

# DELETE	/tasks/:id(.:format)	
# tasks#destroy

# task_search_path	GET	/task_search(.:format)