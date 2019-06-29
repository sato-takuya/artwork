class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALLOWED_CONTENT_TYPES = %q{
    image/jpeg
    image/png
    image/jpg
    image/gif
    image/bmp
  }
end
