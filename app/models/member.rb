class Member < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid
  has_one_attached :member_image
  attribute :new_member_image

  validate if: :new_member_image do
    if new_member_image.respond_to?(:content_type)
      unless new_member_image.content_type.in?(ALLOWED_CONTENT_TYPES)
        errors.add(:new_member_image,:invalid_image_type)
      end
    else
      errors.add(:new_member_image,:invalid)
    end
  end

  before_save do
    if new_member_image
      self.member_image = new_member_image
    end
  end

  def to_param
    public_uid
  end
end
