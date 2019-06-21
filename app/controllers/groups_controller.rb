class GroupsController < ApplicationController
  def index
    @group = Group.find_by(nickname: params[:id])
    @audios = @group.audios
    @videos = @group.videos
  end

  def about
    @group = Group.find_by(nickname: params[:id])
    @members = @group.members
  end
end
