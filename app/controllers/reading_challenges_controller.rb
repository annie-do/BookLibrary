class ReadingChallengesController < ApplicationController
    skip_before_action :authenticate_account!, only: [:index, :show]

    def index
        @reading_challenges = ReadingChallenge.all
        # render 'reading_challenges/index.html.erb'
    end

    def show
        @reading_challenge = ReadingChallenge.find(params[:id])
        # render 'reading_challenges/show.html.erb'
    end
    
    def new
        @reading_challenge = ReadingChallenge.new
        # render 'reading_challenges/new.html.erb'
    end

    def create
        @reading_challenge = ReadingChallenge.new(params.require(:reading_challenge).permit(:book_title, :comment, :reading_date))        
        # render 'reading_challenges/create.html.erb'
        if @reading_challenge.save
            redirect_to reading_challenge_url(@reading_challenge), notice: 'Reading challenge was successfully created.'
        else
            flash.now[:alert] = 'Error! Unable to create reading challenge.'
            render :new
        end
    end

    def edit
        @reading_challenge = ReadingChallenge.find(params[:id])
        # render 'multiple_choice_questions/edit.html.erb'
    end

    def update
        @reading_challenge = ReadingChallenge.find(params[:id])
        if @reading_challenge.update(params.require(:reading_challenge).permit(:book_title, :comment, :reading_date))
            redirect_to reading_challenge_url(@reading_challenge), notice: 'School multiple choice question
            was successfully updated.'
        else
            flash.now[:alert] = 'Error! Unable to update reading challenge.'
            render :edit
        # render 'multiple_choice_questions/edit.html.erb'
        end
    end
    
    def destroy
        @reading_challenge = ReadingChallenge.find(params[:id])
        @reading_challenge.destroy
        redirect_to reading_challenges_url, notice: 'Reading challenge was successfully destroyed.'
    end
    
end
