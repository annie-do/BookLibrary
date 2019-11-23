class BooksController < ApplicationController
    skip_before_action :authenticate_account!, only: [:index, :show]
    
    def index
        @books = Book.all
    end

    def show
        begin
            @book = Book.find(params[:id])
        rescue
            redirect_to bookstore_url, alert: 'Error: Book not found'
        end
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(params.require(:book).permit(:title, :author, :genre, :summary, :price, :cover_url))
        if @book.save
            redirect_to profile_url(@book),
            notice: 'Book successfully created'
        else
            flash.now[:alert] = 'Error! Unable to create book.'
            render :new
        end
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        
        if @book.update(params.require(:book).permit(:title, :author, :genre, :summary, :price, :cover_url, :account_id, :bookstore_id))
            flash.now[:notice] = 'Book was successfully updated'
            redirect_to profile_url(@book)
        else
            flash.now[:alert] = 'Error! Unable to update book.'
            render :edit
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_url, notice: 'Book was successfully destroyed.'
    end

    def personalLibrary
        @books = current_account.books
    end
end
