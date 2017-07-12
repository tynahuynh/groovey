class ArtistsController < ApplicationController
	def index

  RSpotify.authenticate(ENV["spotify_client_id"], ENV["spotify_client_secret"])
   if !params[:artist_name].empty?
   	@arr_artist = params[:artist_name].split(',')

   	@artists_tracks = @arr_artist.map { |artist| RSpotify::Artist.search(artist).first.top_tracks(:US) }

   	# @albums = @arr_artist.map { |artist| RSpotify::Artist.search(artist).first.albums }

   	# @albums_arr = @albums.flatten

   	# @tracks = @albums_arr.map { |album| album.tracks}

   	@tracks_arr = @artists_tracks.flatten
   	@tracks_id = @tracks_arr.map { |track| track.id }

   	@random_tracks = @tracks_id.shuffle.first(30)

   	@string = @random_tracks.join(",")

   	@site = "https://embed.spotify.com/?theme=white&uri=spotify:trackset:My Playlist:"+ @string



   else
     redirect_to root_path
   end

  rescue
  redirect_to root_path, error: 'Something bad happened'

 end
end
