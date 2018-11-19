class SongsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist 
  
  def index
    @songs = @artist.songs
  end

  def show
  end

  def edit
  end

  def update
    if @song.update
      redirect_to artist_songs_path(artist)
    else
      render :edit
    end
  end

  def new
   @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path
    else
      render :new
    end
  end

  def destroy
    set_song
    @song.destroy
    redirect_to artist_songs_path
  end


      private

      def song_params
        params.require(:song).permit(:title)
      end

      def set_song
        @song = Song.find(params[:id])
      end

      def set_artist
        @artist = Artist.find(params[:artist_id])
      end

      def set_billboard
        @billboard = Billboard.find(params[:billboard_id])
      end


end
