class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_attached_file :image, 
    styles: { medium: '400x400>' }, 
    convert_options: {
      medium: " -gravity center -extent 400x400",
    }

  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
