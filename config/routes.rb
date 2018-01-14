Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RuCaptcha::Engine => "/rucaptcha"
  root 'welcomes#index'
  resources :attachments,:only=>[:create] do
    collection do
      post :batch_upload
    end
  end

  namespace :admin do
    root 'welcomes#index'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    post '/verify_rucaptcha' =>'sessions#verify_rucaptcha'
    resources :admins, :only=>[:edit, :update]
    resources :settings do
      collection do
        post :update_cache
      end
    end
    resources :data_backups
    resources :exception_logs,:only=>[:index,:show] do
      collection do
        post :delete_all,:delete
      end
    end
    resources :templates
    resources :pages
    resources :article_categories do
      resources :articles do
        collection do
          post :update_position
        end
      end
    end
  end

end
