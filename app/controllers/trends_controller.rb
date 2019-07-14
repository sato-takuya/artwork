class TrendsController < ApplicationController
  def index
    @users = User.all
    render :layout => 'landing_page'
  end
end
