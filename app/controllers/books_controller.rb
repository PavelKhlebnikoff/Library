class BooksController < ApplicationController

  before_action :find_book,  only: [:show, :edit, :update, :destroy, :upvote]
  before_action :find_genre, only: [:index, :edit, :update, :new, :create]

  def index
    @books = Book.where(genre_id: params[:genre_id])
  end

  # /books/1 GET
  def show
  end

  # /books/new GET # в связке с creat
  def new
    @book = Book.new
  end

  # /books/1/edit GET # в связке с update
  def edit
  end

  # /books POST
  def create
    @book = Book.create(book_params)
    if @book.errors.empty?
      redirect_to genre_book_path(@genre, @book)
    else
      render "new"
    end
  end

  # /books/1 PUT
  def update
    @book.update_attributes(book_params)
    if @book.errors.empty?
      redirect_to genre_book_path(@genre, @book)
    else
      render "edit"
    end
  end

  # /books/1 DELETE
  def destroy
    @book.destroy
    redirect_to action: "index"
  end

  def upvote
    @book.increment!(:votes_count)
    redirect_to action: "index"
  end

  private

  def find_genre
    @genre = Genre.find(params[:genre_id])
  end

  def find_book
     @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :available, :floor, :quantity)
  end

end
