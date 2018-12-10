class AudioBooksController < ApplicationController

  before_action :find_book,  only: [:show, :edit, :update, :destroy, :upvote]
  before_action :find_genre, only: [:index, :edit, :update, :new, :create]

  def index
    @audio_books = AudioBook.where(genre_id: params[:genre_id])
  end

  # /audio_books/1 GET
  def show
  end

  # /audio_books/new GET # в связке с creat
  def new
    @audio_book = AudioBook.new
  end

  # /audio_books/1/edit GET # в связке с update
  def edit
  end

  # /audio_books POST
  def create
    @audio_book = AudioBook.create(book_params)
    if @audio_book.errors.empty?
      redirect_to genre_audio_book_path(@genre, @audio_book)
    else
      render "new"
    end
  end

  # /audio_books/1 PUT
  def update
    @audio_book.update_attributes(book_params)
    if @audio_book.errors.empty?
      redirect_to genre_audio_book_path(@genre, @audio_book)
    else
      render "edit"
    end
  end

  # /audio_books/1 DELETE
  def destroy
    @audio_book.destroy
    redirect_to action: "index"
  end

  def upvote
    @audio_book.increment!(:votes_count)
    redirect_to action: "index"
  end

  private

  def find_genre
    @genre = Genre.find(params[:genre_id])
  end

  def find_book
    @audio_book = AudioBook.find(params[:id])
  end

  def book_params
    params.require(:audio_book).permit(:name, :available, :floor, :quantity, :genre_id)
  end

end



