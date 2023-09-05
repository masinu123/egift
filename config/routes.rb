Rails.application.routes.draw do
  devise_for :users

  scope '/v1', module: 'api/v1' do
    get :products, to: 'get_products#call'
    get :cards, to: 'get_cards#call'
    get :request_card, to: 'request_card#call'
  end

  scope '/oms', module: :oms, as: :oms do
    resources :brands do
      collection do
        get :selection
      end

      member do
        get :deactivate
      end
    end
    resources :oms_form_brands, path: :brands

    resources :products do
      collection do
        get :selection
      end

      member do
        get :deactivate
      end
    end
    resources :oms_form_products, path: :products

    resources :cards do
      member do
        get :activate
        get :deactivate
      end
    end
    resources :oms_form_cards, path: :cards

    resources :users, only: [:index, :edit, :update] do
      collection do
        get :selection
      end
    end
    resources :oms_form_users, path: :users

    resources :roles
    resources :oms_form_roles, path: :roles
  end
  root 'oms/brands#index'
end
