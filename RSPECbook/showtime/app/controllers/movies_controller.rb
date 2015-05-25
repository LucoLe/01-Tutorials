class MoviesController < ApplicationController
  def index
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end

  def create
    Movie.create!(movie_params)
    redirect_to movies_path
  end

  private

    def movie_params
      params.require(:movie).permit!
      params[:movie].merge(genres: Genre.find(params[:genres]))
    end
end
