class GroupsController < ApplicationController
  def index
    @group = Group.find_by(nickname: params[:id])
    @elements = @group.elements
  end

  def about
    @group = Group.find_by(nickname: params[:id])
  end
end
