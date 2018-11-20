class BillboardsController < ApplicationController
  before_action :set_billboard, except: [:index, :new, :create]

  def index
    @billboards = Billboard.all
  end

  def show
    @songs = @billboard.songs
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to @billboard
    else
      render :new
    end
  end

  def destroy
    @billboard.songs.update_all(billboard_id: nil)
    @billboard.destroy
    redirect_to billboards_path
  end

  def new_song
    # Grab all songs that don't already belong to a billboard
    @songs = Song.all.where(billboard_id: nil)
    # render :new
  end

  def add_song
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    # remove the billboard_id so it is no longer associated
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

      private

      def set_billboard
        @billboard = Billboard.find(params[:id])
      end

      def billboard_params
        params.require(:billboard).permit(:name, :genre)
      end
end
