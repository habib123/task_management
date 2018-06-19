class ExpertDetail < ApplicationRecord
  belongs_to :expert, inverse_of: :expert_detail
end
