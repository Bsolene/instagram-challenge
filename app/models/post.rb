class Post < ApplicationRecord
  has_attached_file :image, 
    styles: { medium: '400x400^' }, 
    convert_options: {
      medium: " -gravity center -crop '400x400+0+0'",
    }

  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
