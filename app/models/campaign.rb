class Campaign < ApplicationRecord
  has_many :todos, inverse_of: :campaign, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user, inverse_of: :campaigns
  validates :title, :tags,:start_date, :end_date, presence: true
  validate :end_date_is_after_start_date

  private
    def end_date_is_after_start_date
      return if start_date.blank? || end_date.blank?
      if end_date < start_date
        errors.add(:end_date, "can not be before the start_date")
      end
    end
end
