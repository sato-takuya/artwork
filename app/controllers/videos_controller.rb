class VideosController < ApplicationController
  def index
    @user = User.find_by(nickname: params[:id])
    @videos = @user.videos
  end

  def show
    @video = Video.find_by(public_uid: params[:public_uid])
    #user-nickname
    user_id = @video.user.id
    #nicknameからvideo_all探す
    @video_all = Video.where(user_id: user_id)
  end

  def new
    @video = Video.new()
  end

  def create
    @video = Video.new(videos_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
    @video = Video.find_by(public_uid: params[:public_uid])
  end

  def update
    @video = Video.find_by(public_uid: params[:public_uid])
    @video.assign_attributes(videos_params)
    @video.user_id = current_user.id
    if @video.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def destroy
    @video = Video.find_by(public_uid: params[:public_uid])
    @video.destroy
    redirect_to "/#{current_user.nickname}",notice:"削除しました"
  end

  private
  def videos_params
    params.require(:video).permit(:video_title,:video_url,:video_lyrics)
  end
end
