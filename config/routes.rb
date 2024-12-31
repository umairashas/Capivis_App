Rails.application.routes.draw do
  resources :centres
  resources :donor_handbooks
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
  root "pages#home" 
  get 'all_questions', to: 'questions#all_questions'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact' 
  get 'terms_and_conditions', to: 'donors#terms_and_conditions'
  resources :pages, only: [:edit, :update, :show]
  resources :donors 
  resources :donor_history_questionnaires, only: [:index, :edit, :update, :new, :create]
  resources :questions do
  collection do
    get :all_donors
  end
end

end
