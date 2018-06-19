class Assignment < ApplicationRecord
  belongs_to :user, inverse_of: :assignments
  belongs_to :role, inverse_of: :assignments
end
