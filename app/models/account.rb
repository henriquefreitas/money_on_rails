class Account < ApplicationRecord
  belongs_to :tenant
  has_many :transactions
  has_many :transfers_to, class_name: 'Transfer', foreign_key: 'to_account_id'
  has_many :transfers_from, class_name: 'Transfer', foreign_key: 'from_account_id'
end
