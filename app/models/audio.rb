class Audio < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid

  has_one_attached :audio_image
  attribute :new_audio_image

  before_save do
    if new_audio_image
      self.audio_image = new_audio_image
    end
  end

  def to_param
    public_uid
  end
end
