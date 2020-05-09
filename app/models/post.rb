class Post < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :title, presence: true, length: { maximum: 25}
  validates :content, presence: true, uniqueness: true
end
