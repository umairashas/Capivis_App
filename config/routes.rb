  Rails.application.routes.draw do
    resources :donor_screenings
    resources :centres
    resources :donors

    if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
    end

    namespace :admin do
       resources :donors
       get "/dashboard", to: "admin#dashboard"
    end


      resources :operators do
       member do
          get "centre_and_donor_details"
       end
    end
    resources :donor_handbooks
    devise_for :users, controllers: {
    registrations: "users/registrations"
  }
    root "pages#home"
    get "all_questions", to: "questions#all_questions"
    get "home", to: "pages#home"
    get "about", to: "pages#about"
    get "contact", to: "pages#contact"
    get "terms_and_conditions", to: "donors#terms_and_conditions"
    resources :pages, only: [ :edit, :update, :show ]
    resources :donor_history_questionnaires, only: [ :index, :edit, :update, :new, :create ]
    resources :questions do
    collection do
      get :all_donors
    end
  end
  end
