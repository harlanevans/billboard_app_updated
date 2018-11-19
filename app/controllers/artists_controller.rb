class ArtistsController < ApplicationController
  
  before_action :set_artist, except: [:index, :new, :create]
  
  
  def index
    @artists = Artist.all
  end

  def show
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path
    else
      render :edit
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

      private
      
      def artist_params
        params.require(:artist).permit(:name)
      end

      def set_artist
        @artist = Artist.find(params[:id])
      end
end
