class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :url, presence: true
  validates :urlToImage, presence: true
  validates :publishedAt, presence: true
end
