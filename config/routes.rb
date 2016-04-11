Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => 'sidekiq'

  # Dashboard
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Consultants
  get 'bem-vinda',         to: 'consultants#initial_setup', as: 'consultant_initial_setup'
  patch 'consultoras/:id', to: 'consultants#update',        as: 'update_consultant'

  # Sales
  get 'vendas',            to: 'sales#index',  as: 'sales_index'
  get 'vendas/nova',       to: 'sales#new',    as: 'new_sale'
  get 'vendas/:id/editar', to: 'sales#edit',   as: 'edit_sale'
  get 'vendas/deletar',    to: 'sales#delete', as: 'delete_sale'
  get 'vendas/:id',        to: 'sales#show',   as: 'sale'
  post 'ventas/criar',     to: 'sales#create', as: 'create_sale'

  # Customers
  get 'clientes',            to: 'customers#index',  as: 'customers_index'
  get 'clientes/nova',       to: 'customers#new',    as: 'new_customer'
  get 'clientes/:id/editar', to: 'customers#edit',   as: 'edit_customer'
  get 'clientes/:id',        to: 'customers#show',   as: 'customer'
  post 'clientes/criar',     to: 'customers#create', as: 'create_customer'
  get 'clientes/:id/agendar-contato', to: 'customers#schedule_contact', as: 'schedule_contact_with_customer'
  patch 'clientes/:id',   to: 'customers#update', as: 'update_customer'

  # Products'
  get 'produtos',            to: 'products#index',  as: 'products'
  get 'produtos/:id/editar', to: 'products#edit',   as: 'edit_product'
  get 'produto/:id',         to: 'products#show',   as: 'product'
  get 'produtos/busca',      to: 'products#search', as: 'search_product'
  patch 'produto/:id',      to: 'products#update', as: 'update_product'

  # Requests
  get  '/pedidos',         to: 'requests#index', as: 'requests_index'
  get  '/pedidos/novo',    to: 'requests#new',   as: 'new_request'
  post '/requests/upload', to: 'requests#upload'

  devise_for :users, controllers: { registrations: "registrations" }

  root 'dashboard#index'
end
