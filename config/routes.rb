Rails.application.routes.draw do

  # Dashboard
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Sales
  get 'vendas',            to: 'sales#index',  as: 'sales_index'
  get 'vendas/nova',       to: 'sales#new',    as: 'new_sale'
  get 'vendas/:id/editar', to: 'sales#edit',   as: 'edit_sale'
  get 'vendas/deletar',    to: 'sales#delete', as: 'delete_sale'
  get 'vendas/:id',        to: 'sales#show',   as: 'show_sale'
  post 'ventas/criar',     to: 'sales#create', as: 'create_sale'

  # Customers
  get 'clientes',        to: 'customers#index',  as: 'customers_index'
  get 'clientes/nova',   to: 'customers#new',    as: 'new_customer'
  get 'clientes/editar', to: 'customers#edit',   as: 'edit_customer'
  get 'clientes/:id',    to: 'customers#show',   as: 'show_customer'
  post 'clientes/criar', to: 'customers#create', as: 'create_customer'
  get 'clientes/:id/agendar-contato', to: 'customers#schedule_contact', as: 'schedule_contact_with_customer'
  post 'clientes/:id',   to: 'customers#update', as: 'update_customer'

  # Products'
  get 'produtos',            to: 'products#index', as: 'products_index'
  get 'produtos/:id/editar', to: 'products#edit',  as: 'edit_product'

  # Requests
  get  '/pedidos',         to: 'requests#index', as: 'requests_index'
  get  '/pedidos/novo',    to: 'requests#new',   as: 'new_request'
  post '/requests/upload', to: 'requests#upload'

  devise_for :users
  root 'dashboard#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
