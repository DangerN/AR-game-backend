Rails.application.routes.draw do
  resources :records
  post 'authenticate', to: 'authentication#authenticate'
  get 'leaders', to: 'records#leaders'
end
