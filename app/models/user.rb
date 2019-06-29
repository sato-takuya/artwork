class User < ApplicationRecord
  ###include ActiveHash::Associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable

  has_many :audios
  has_many :members
  has_many :videos

  has_one_attached :top_image
  has_one_attached :icon_image
  attribute :new_top_image
  attribute :new_icon_image

  validate if: :new_top_image do
    if new_top_image.respond_to?(:content_type)
      unless new_top_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_top_image,"エラー")
      end
    else
      errors.add(:new_top_image,:invalid)
    end
  end

  validate if: :new_icon_image do
    if new_icon_image.respond_to?(:content_type)
      unless new_icon_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_icon_image,:invalid_image_type)
      end
    else
      errors.add(:new_icon_image,:invalid)
    end
  end

  before_save do
    if new_top_image
      self.top_image = new_top_image
    end
  end

  before_save do
    if new_icon_image
      self.icon_image = new_icon_image
    end
  end



  def to_param
    nickname
  end


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        location: auth.info.location
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
