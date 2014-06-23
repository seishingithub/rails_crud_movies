class MoviesController < ApplicationController

  def index
    @movie = Movie.new
    @movies = Movie.all
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :index
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes!(movie_params)

    redirect_to movies_path
  end

  def destroy
    @movie = Movie.find(params[:id]).delete

    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :actor)
  end

end