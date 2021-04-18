class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def import
    Book.import(params[:file])
    redirect_to books_path, notice: "Libros importados!"
  end

  # GET /books
  # GET /books.json
  # def index
  #   @books = Book.all
  # end

  def index
    if params.has_key?(:title) || params.has_key?(:discipline) || params.has_key?(:topic)
      if params[:title].present? || params[:discipline].present? || params[:topic].present?
        @books = Book.all.where('title LIKE ? AND discipline LIKE ? AND topic LIKE ?', '%' + params[:title].upcase + '%', '%' + params[:discipline].upcase + '%', '%' + params[:topic].upcase + '%').paginate(page:params[:page], per_page: 10)
      else
        @books = Book.all.paginate(page:params[:page], per_page: 10)
      end

    else
      @books = Book.all.paginate(page:params[:page], per_page: 10)
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @pictures = @book.pictures
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :discipline, :topic, :specialty, :specialty2, :price, :edition, :pub_year, :isbn_10, :isbn_13, :pages, :size, :cover, :volumes, :index)
    end
end
