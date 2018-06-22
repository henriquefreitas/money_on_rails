class Tenant < ApplicationRecord
  has_many :accounts
end
