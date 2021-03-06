class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag
  has_many :comments

  validates :title, presence: true, length: { maximum: 35}
  validates :content, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end
