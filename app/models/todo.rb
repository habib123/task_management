class Todo < ApplicationRecord
  belongs_to :campaign, inverse_of: :todos
  belongs_to :user, inverse_of: :todos
  has_many :comments, as: :commentable,  dependent: :destroy
end
