Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'new_user', to: 'authentication#new_user'
  post 'submit_score', to: 'records#create'
  get 'leaders', to: 'records#leaders'
end
