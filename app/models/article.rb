class Article < ApplicationRecord
  include Visible
  # can retrieve all comments to the article as an array using @article.comments
  # dependent destroys all comments associated with an article
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
