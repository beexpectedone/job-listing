Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  resources :jobs do
    collection do
      get :search
    end  
    resources :resumes
  end

  resources :welcome do

  end

  namespace :admin do
  	resources :jobs do
  	  member do
  	  	post :publish
  	  	post :hide
  	  end

      resources :resumes
  	 end 	
  end

  namespace :users do
    resources :users
  end
  
  root 'welcome#index'
end
