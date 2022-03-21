Rails.application.routes.draw do
	# Api definition
	namespace :api, defaults: {format: :json} do
		namespace :v1 do
			# We are going to list our resources here
			resources :users, only: %i[show create update]
		end
	end
end
