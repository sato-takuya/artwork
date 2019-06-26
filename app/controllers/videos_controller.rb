class VideosController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(nickname: params[:id])
    @videos = @user.videos
  end

  def new
    @video = Video.new()
  end

  def create
    @video = Video.new(videos_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to "/",notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
    @video = Video.find_by(public_uid: params[:id])
  end

  def update
    @video = Video.find_by(public_uid: params[:id])
    @video.assign_attributes(videos_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to "/",notice: "保存しました"
    else
      render "new"
    end
  end

  def destroy
    @video = Video.find_by(public_uid: params[:id])
    @video.destroy
    redirect_to "/",notice:"削除しました"
  end

  private
  def videos_params
    params.require(:video).permit(:video_title,:video_url,:video_lyrics)
  end
end
