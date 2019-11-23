class PagesController < ApplicationController
  skip_before_action :authenticate_account!, only: [:home, :about]
  
  def home
  end

  def about
  end
  
end
