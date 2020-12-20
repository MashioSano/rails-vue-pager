Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"

  get 'posts', to: 'posts#index'
  namespace 'api' do
    resources :posts
  end
end
