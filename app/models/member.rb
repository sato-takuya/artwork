class Member < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid
  has_one_attached :member_image
  attribute :new_member_image

  before_save do
    if new_member_image
      self.member_image = new_member_image
    end
  end

  def to_param
    public_uid
  end
end
