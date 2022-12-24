class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_rich_text :body

  validates :body, presence: true

  after_create_commit -> {
    broadcast_append_to [commetable, :comments], target: dom_id(commentable)
  }
end
