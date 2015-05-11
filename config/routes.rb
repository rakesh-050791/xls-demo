XlsApp::Application.routes.draw do
  resources :meetings


   resources :meetings do
  		collection { post :import }
   end

   root :to => 'meetings#index'
end
