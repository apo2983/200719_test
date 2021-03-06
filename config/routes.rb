Rails.application.routes.draw do

  root to: 'books#top'
  get '/home/about' => 'users#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,except:[:new, :create]

  resources :books,except: [:new] do
  	resource :favorites,only: [:create,:destroy]
  	resources :book_comments,only: [:create,:destroy,:index] 
  end

end
