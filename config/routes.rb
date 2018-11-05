Rails.application.routes.draw do
	root to: "campaings#initial"
	resource :campaings
	resource :systems
	devise_for :users, controllers: { registrations: 'registrations'}
end
