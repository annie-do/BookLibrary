class BookstoresController < ApplicationController
    skip_before_action :authenticate_account!, only: [:index, :show]
    
    def index
        redirect_to Bookstore: 'thing', action: 'show', id: 1, alert: 'Error: Bookstore not found'
    end

    def show
        begin
            @bookstores = Bookstore.find(params[:id])
        rescue
            redirect_to home_url, alert: 'Error: Bookstore not found'
        end
    end
end
