class Audio < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid

  has_one_attached :audio_image
  has_one_attached :audio_file
  attribute :new_audio_image
  attribute :new_audio_file

  validate if: :new_audio_image do
    if new_audio_image.respond_to?(:content_type)
      unless new_audio_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_audio_image,:invalid_image_type)
      end
    else
      errors.add(:new_audio_image,:invalid)
    end
  end

  before_save do
    if new_audio_image
      self.audio_image = new_audio_image
    end
  end

  before_save do
    if new_audio_file
      self.audio_file = new_audio_file
    end
  end

  def to_param
    public_uid
  end
end
