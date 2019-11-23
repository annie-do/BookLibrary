class SearchesController < ApplicationController
    skip_before_action :authenticate_account!, only: [:index, :show]

    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end
    
    def profile
        @book = Book.find(params[:id])
    end
    
    def edit
        @book = Book.find(params[:id])
        current_account.books << @book
        if current_account.save
            flash.now[:notice] = 'Confirm! Order has been process.'
        else
            flash.now[:alert] = 'Error! Unable to update confirm.'
            render :show
        end
    end

    def update
        @book = Book.find(params[:id])
    end

    def checkCouponCode
        @book = Book.find(params[:id])
        @subscription = Subscription.all
        
        @coupon_code = CouponCode.new
        @coupon_code = params[:code]
        if ( (@coupon_code == 'FLEMMINGDISCOUNT') && (@subscription != nil) )
            flash.now[:notice] = 'Congrat! You have received 10% discount on your total.'
            render :checkCouponCode
        else
            flash.now[:alert] = 'Error! Unable to find coupon code.'
            render :show
        end
    end

end
