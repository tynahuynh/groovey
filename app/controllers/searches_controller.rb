class SearchesController < ApplicationController
	def index
		@spotify_user = RSpotify::User.new(session[:hash])
	end
end
