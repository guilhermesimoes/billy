class PagesController < ApplicationController
  def home
    @expenses = current_user.current_month_expenses.order(created_at: :desc)
    @sum_expenses_current_month = @expenses.sum(:amount)
  end
end
