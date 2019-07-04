class Video < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid
  validates :video_url,presence: true

  def to_param
    public_uid
  end
end
