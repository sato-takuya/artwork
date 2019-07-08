class AudiosController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @user = User.find_by(nickname: params[:id])
    @audios = @user.audios
  end

  def show
    @audio = Audio.find_by(public_uid: params[:public_uid])
    user_id = @audio.user.id
    @audio_all = Audio.where(user_id: user_id)
  end

  def new
    @audio = Audio.new()
  end

  def create
    @audio = Audio.new(audios_params)
    @audio.user_id = current_user.id
    if @audio.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
    @audio = Audio.find_by(public_uid: params[:public_uid])
    if @audio.user_id != current_user.id
      redirect_to "/"
    end
  end

  def update
    @audio = Audio.find_by(public_uid: params[:public_uid])

    @audio.assign_attributes(audios_params)
    @audio.user_id = current_user.id
    if @audio.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def destroy
    @audio = Audio.find_by(public_uid: params[:public_uid])
    @audio.destroy
    redirect_to "/#{current_user.nickname}",notice:"削除しました"
  end

  private
  def audios_params
    params.require(:audio).permit(:audio_title,:audio_file,:audio_lyrics,:audio_image)
  end
end
