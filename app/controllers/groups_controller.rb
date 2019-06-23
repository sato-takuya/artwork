class GroupsController < ApplicationController
  def index
    @group = User.find_by(nickname: params[:id])
    @audios = @group.audios
    #@videos = @group.videos
    @members = @group.members
  end
end
