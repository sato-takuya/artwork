class Video < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid generator: PublicUid::Generators::HexStringSecureRandom.new(16)
  validates :video_url,presence: true

  def to_param
    public_uid
  end
end
