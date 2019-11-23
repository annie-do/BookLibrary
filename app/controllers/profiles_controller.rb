class ProfilesController < ApplicationController
    skip_before_action :authenticate_account!, only: [:index]

    def index
        # render index.html.erb
    end

    def new
        # render new.html.erb
    end

    def create
        # create database entry
    end

    def edit
        # render edit.html.erb
    end

    def update
        # update extant database entry
    end

    def destroy
        # delete extant database entry
    end
end
