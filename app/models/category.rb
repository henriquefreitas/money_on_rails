class Category < ApplicationRecord
  has_many :sub_categories, class_name: 'Category', foreign_key: 'group_id'
  belongs_to :group, class_name: 'Category', optional: true
  has_many :category_transactions
end
