module Assignmentable
  extend ActiveSupport::Concern
    included do
      has_many :assignments, as: :assignmentable
      has_many :roles, through: :assignments
      accepts_nested_attributes_for :assignments, allow_destroy: true
    end
end
