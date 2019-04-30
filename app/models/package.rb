class Package < ApplicationRecord
  belongs_to :token
  validates_presence_of :subject, :request
end
