require "sidekiq/web"

Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users, controllers: {
      registrations: "users"
    }

    resource :about, only: :show, controller: :about
    resource :conduct, only: :show
    resource :home, only: :show
    resource :pricing, only: :show, controller: :pricing
    resource :recommended_sorting, only: :show
    resource :role, only: :new
    resources :affiliates, only: %w[index create new], controller: "affiliates/registrations"

    resources :businesses, except: :destroy
    resources :specialties, only: :index

    namespace :businesses do
      resources :hiring_invoice_requests, only: [:new, :create]
    end

    # /notifications/read must come before /notifications/:id.
    resources :read_notifications, only: [:index, :create], path: "/notifications/read"
    resources :notifications, only: %i[index show]

    namespace :analytics do
      resources :events, only: :show
    end

    resources :conversations, only: %i[index show] do
      resource :block, only: %i[new create]
      resources :messages, only: :create
    end

    resources :developers, except: :destroy do
      resources :messages, only: %i[new create], controller: :cold_messages
      resources :public_profiles, only: :new
    end

    namespace :developers do
      resources :celebration_package_requests, only: [:new, :create]
    end

    get "developers/:id/:key", to: "developers#show", as: :developer_public

    resource :hired, only: :show, controller: :hired

    namespace :hiring_agreement, module: :hiring_agreements do
      resource :terms, only: :show
      resource :signature, only: %i[new create]
    end

    namespace :open_startup, path: "/open" do
      resources :contributions, only: :index
      resources :expenses, only: :index
      resources :revenue, only: :index

      root to: "dashboard#show"
    end

    namespace :policies do
      resource :privacy, only: :show, controller: :privacy
      resource :terms, only: :show
    end

    namespace :users do
      resource :suspended, only: :show, controller: :suspended
    end

    root to: "home#show"
  end

  namespace :admin do
    resource :impersonate, only: [:create, :destroy]
    resources :conversations, only: :index
    resources :specialties
    resources :transactions, except: :show
    resources :users, only: [:index] do
      resources :referrals, only: :index, module: :users
    end

    namespace :conversations do
      resources :blocks, only: :index
    end

    resources :businesses, only: [] do
      resources :conversations, only: :index, controller: :business_conversations
      resources :invisiblizes, only: :create, module: :businesses
    end

    namespace :businesses do
      resources :hiring_invoice_requests, only: [:index, :show]
    end

    resources :developers, only: [] do
      resource :source_contributors, only: %i[create destroy], module: :developers
      resources :conversations, only: :index, controller: :developer_conversations
      resources :features, only: :create
      resources :invisiblizes, only: :create, module: :developers
    end

    namespace :developers do
      resources :celebration_package_requests, only: [:index, :show]
    end

    namespace :hiring_agreements do
      resources :terms, except: :destroy do
        resource :activation, only: %i[create destroy], module: :terms
      end
    end

    resources :referrals, only: :index
  end

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resource :auth, only: [:create, :destroy]
      resources :notification_tokens, only: :create
    end
  end

  namespace :stripe do
    resource :checkout, only: :create
    resource :portal, only: :show
  end

  namespace :turbo do
    namespace :ios do
      resource :path_configuration, only: :show
    end
  end

  namespace :webhooks do
    resource :postmark, only: :create, controller: :postmark
    resource :revenuecat, only: :create, controller: :revenue_cat
  end

  get "/sitemap.xml.gz", to: redirect("#{Rails.configuration.sitemaps_host}sitemaps/sitemap.xml.gz"), as: :sitemap
  get "robots.:format" => "robots#index"

  authenticate :user, lambda { |user| SidekiqPolicy.new(user).visible? } do
    mount Sidekiq::Web => "/sidekiq"
  end
end
