class Expense < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  attribute :created_at, :date, default: -> { Date.current }

  validates :amount, :description, :categories, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
