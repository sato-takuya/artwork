class Audio < ApplicationRecord
  belongs_to :user, optional: true
  generate_public_uid

  def to_param
    public_uid
  end
end
