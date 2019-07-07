class MembersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @user = User.find_by(nickname: params[:id])
    @members = @user.members
    if @user.id != current_user.id
      redirect_to "/"
    end
  end

  def new
    @member = Member.new()
    if @member.user.id != current_user.id
      redirect_to "/"
    end
  end

  def create
    @member = Member.new(members_params)
    @member.user_id = current_user.id
    if @member.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def edit
    @member = Member.find_by(public_uid: params[:id])
    if @member.user.id != current_user.id
      redirect_to "/"
    end
  end

  def update
    @member = Member.find_by(public_uid: params[:id])
    @member.assign_attributes(members_params)
    @member.user_id = current_user.id

    if @member.save
      redirect_to "/#{current_user.nickname}",notice: "保存しました"
    else
      render "new"
    end
  end

  def destroy
    @member = Member.find_by(public_uid: params[:id])
    @member.destroy
    redirect_to "/#{current_user.nickname}",notice:"削除しました"
  end

  private
  def members_params
    params.require(:member).permit(:member_name,:part,:member_info,:new_member_image,:twitter_id,:instagram_id)
  end
end
