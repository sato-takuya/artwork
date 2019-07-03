class Audio < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :audio_file, AudiofileUploader
  mount_uploader :audio_image, AudioimageUploader
  generate_public_uid





  def to_param
    public_uid
  end
end
