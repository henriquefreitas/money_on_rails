class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :payee
  has_many :category_transactions
end
