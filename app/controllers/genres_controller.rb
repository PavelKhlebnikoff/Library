class GenresController < ApplicationController
  before_action :authenticate_user!, except:  [:show, :index]
  before_action :find_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  # /genres/1 GET
  def show
  end

  # /genres/new GET
  def new
    @genre = Genre.new
  end

  # /genres/1/edit GET
  def edit
  end

  # /genres POST
  def create
    @genre = Genre.create(genre_params)
    if @genre.errors.empty?
      redirect_to genre_path(@genre)
    else
      render "new"
    end
  end

  # /genres/1 PUT
  def update
    @genre.update_attributes(genre_params)
    if @genre.errors.empty?
      redirect_to genre_path(@genre)
    else
      render "edit"
    end
  end

  # /genres/1 DELETE
  def destroy
    @genre.destroy
    redirect_to action: "index"
  end

  private

  def find_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end

end
