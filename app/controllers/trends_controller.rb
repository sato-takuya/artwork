class TrendsController < ApplicationController
  def index
    @users = User.all
  end
end
