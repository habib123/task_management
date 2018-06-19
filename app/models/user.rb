class User < ApplicationRecord
  USER_ROLE_PRIORITY= ["Novice", "Expert"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :campaigns, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :todos, inverse_of: :user
  accepts_nested_attributes_for :assignments, allow_destroy: true
  validates :username, presence: true

  def self.types
    %w(Expert Novice)
  end

  private

    def attributes_protected_by_default
      super - [self.class.inheritance_column]
    end
end
