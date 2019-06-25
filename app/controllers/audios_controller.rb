class AudiosController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(nickname: params[:id])
    @audios = @user.audios
  end

  def new
    @audio = Audio.new()
  end

  def create
    @audio = Audio.new(audios_params)
    @audio.user_id = current_user.id
    if @audio.save
      redirect_to "/",notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
    @audio = Audio.find_by(public_uid: params[:id])
  end

  def update
    @audio = Audio.find_by(public_uid: params[:id])
    @audio.assign_attributes(audios_params)
    @audio.user_id = current_user.id
    if @audio.save
      redirect_to "/",notice: "保存しました"
    else
      render "new"
    end

  end

  def destroy
  end

  private
  def audios_params
    params.require(:audio).permit(:audio_title,:source,:audio_lyrics,:audio_image)
  end
end
