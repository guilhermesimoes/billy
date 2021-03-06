class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :expenses
  has_many :smart_expenses

  attribute :currency, :string, default: '€'

  validates :currency, presence: true

  def current_month_expenses
    expenses.where('created_at >= ?', DateTime.now.beginning_of_month)
  end
end
