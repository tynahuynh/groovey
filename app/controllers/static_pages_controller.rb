class StaticPagesController < ApplicationController
	def spotify
		@spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
		hash = @spotify_user.to_hash
		session[:hash] = hash
		redirect_to searches_path
	end

	def index

	end
end
