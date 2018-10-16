Rails.application.routes.draw do
	get "access", to: "users#access", as: :access
	post "login", to: "users#login", as: :login
	root to: "users#access"
	devise_for :users, controllers: { registrations: 'registrations'}
end
