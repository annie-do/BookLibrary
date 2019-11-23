class SubscriptionsController < ApplicationController 
    skip_before_action :authenticate_account!, only: [:index, :show]
    
    def index
        @subscriptions = Subscription.all
    end
    def show
        begin
            @subscription = Subscription.find(params[:id])
        rescue
            redirect_to home_url, alert: 'Something done goofed'
        end
    end
    def new 
        @subscription = Subscription.new
    end
    def buy
        now = DateTime.now
        DateTime.new(now.year, now.month, now.day, 0, 0, 0, now.zone) 
        
        @subscription = Subscription.new
        @subscription.start_date = DateTime.new(now.year, now.month, now.day, now.hour, now.minute, now.second, now.zone)
        if params[:choice] && params[:choice] == '0'
            @subscription.price = 19.99
            @subscription.end_date = DateTime.new(now.year, now.month, now.day, now.hour, now.minute, now.second, now.zone) >> 1
            current_account.subscription << @subscription
            if current_account.save
                redirect_to home_url, notice: "You have succefully Subscribed"
            else 
                redirect_to home_url, alert: "Something horrible happened and you weren't charged. We appologize for the inconvience."
            end 
        elsif params[:choice] && params[:choice] == '1'
            @subscription.price = 34.99
            @subscription.end_date = DateTime.new(now.year, now.month, now.day, now.hour, now.minute, now.second, now.zone) >> 2   
            current_account.subscription << @subscription
            if current_account.save
            redirect_to home_url, notice: "You have succefully Subscribed"
            else 
            redirect_to home_url, alert: "Something horrible happened and you weren't charged. We appologize for the inconvience."    
            end
        end           
    end    
    def destroy
        @subscription = Subscription.find(params[:id])
        @subscription.destroy
        redirect_to subscriptions_url, notice: 'Subscription was successfully canceled.'
    end
end

