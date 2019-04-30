class Token < ApplicationRecord
  belongs_to :state
  belongs_to :recipient
  has_one :package, inverse_of: :token, dependent: :destroy
  accepts_nested_attributes_for :package, reject_if: :all_blank, allow_destroy: true
end
