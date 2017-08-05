class ArtistsController < ApplicationController
  def index
  @spotify_user = RSpotify::User.new(session[:hash])

   if !params[:artist_name].empty?
    @arr_artist = params[:artist_name].split(',')

    @artists_tracks = @arr_artist.map { |artist| RSpotify::Artist.search(artist).first.top_tracks(:US) }

    # @albums = @arr_artist.map { |artist| RSpotify::Artist.search(artist).first.albums }

    # @albums_arr = @albums.flatten

    # @tracks = @albums_arr.map { |album| album.tracks}

    @tracks_arr = @artists_tracks.flatten.shuffle.first(50)
    # @tracks_id = @tracks_arr.map { |track| track.id }

    # @random_tracks = @tracks_id.shuffle.first(30)

    # @string = @random_tracks.join(",")
    playlist = @spotify_user.create_playlist!('groovey')

    playlist.add_tracks!(@tracks_arr)

    user = @spotify_user.id
    playlist_id = playlist.id
    @url = "https://open.spotify.com/embed?uri=spotify:user:"+ user +":playlist:"+ playlist_id

   else
     redirect_to searches_path
   end

  rescue
   redirect_to searches_path, error: 'Something bad happened'

 end
end
