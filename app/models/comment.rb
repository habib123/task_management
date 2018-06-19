class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user, inverse_of: :comments
  validates :title, presence: true
  scope :todo_commentable, -> { where(commentable_type: 'Todo' ) }
  scope :campaign_commentable, -> { where(commentable_type: 'Campaign' ) }
end
