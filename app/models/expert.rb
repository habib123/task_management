class Expert < User
    has_one :expert_detail, inverse_of: :expert, dependent: :destroy, autosave: true
    accepts_nested_attributes_for :expert_detail, reject_if: :all_blank ,allow_destroy: true
    #validates :service, presence: true
end
