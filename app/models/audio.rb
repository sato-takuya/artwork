class Audio < ApplicationRecord
  belongs_to :user, optional: true
end
