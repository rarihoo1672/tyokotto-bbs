class Comment < ApplicationRecord
  belongs_to :post

  validates :text, presence: true, dependent: :destoroy
end
