class ReviewsController < ApplicationController
  skip_before_action :authenticate_account!, only: [:index, :show]

def index
    @reviews = Review.all #find(params[:id])
end

def show
    begin
      @review = Review.find(params[:id])
    rescue
      redirect_to review_url, alert: 'error: review not found'
    end
end

def new
  begin
    @book = Book.find(params[:book_id])
  rescue
    redirect_to books_url, alert: 'Some how your trying to review a book that doesnt exsist'
  end
  @review = Review.new
end

def create
    @book = Book.find(params[:book_id])
    @review = Review.new(params.require(:review).permit(:rating,:comment))
    @book.critiques << @review
    if @review.save
      redirect_to profile_path(@book), notice: "Thanks for your reveiw!"
    else
      flash.now[:alert] = "ERROR! Ya done goofed"
      render :new
    end
end

def destroy
    @review = Review.find(params[:id])  
    @book = @review.media
    @review.destroy
    redirect_to book_url(@book), notice: 'You have Removed your reveiw.'
end        
end

