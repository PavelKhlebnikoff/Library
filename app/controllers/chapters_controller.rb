class ChaptersController < ApplicationController
  before_action :find_chapter,  only: [:show, :edit, :update, :destroy, :upvote]
  before_action :find_genre,    only: [:index, :edit, :update, :new, :create]
  before_action :find_book,     only: [:index, :edit, :update, :new, :create]

  def index
    @chapters = Chapter.where(genre_id: params[:genre_id], book_id:  params[:book_id])
  end

  # /chapters/1 GET
  def show
  end

  # /chapters/new GET # в связке с creat
  def new
    @chapter = Chapter.new
  end

  # /chapters/1/edit GET # в связке с update
  def edit
  end

  # /chapters POST
  def create
    @chapter = Chapter.create(chapter_params.merge(book_id: @book.id, genre_id: @genre.id))
    if @chapter.errors.empty?
      redirect_to genre_book_chapter_path(@genre, @book, @chapter)
    else
      render "new"
    end
  end

  # /chapters/1 PUT
  def update
    @chapter.update_attributes(chapter_params)
    if @chapter.errors.empty?
      redirect_to genre_book_chapter_path(@genre, @book, @chapter)
    else
      render "edit"
    end
  end

  # /chapters/1 DELETE
  def destroy
    @chapter.destroy
    redirect_to action: "index"
  end

  private

  def find_genre
    @genre = Genre.find(params[:genre_id])
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_chapter
    @chapter = Chapter.find(params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:name, :text)
  end

end
