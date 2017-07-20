class ExpensesController < ApplicationController
  before_action :authenticate_user!

  # GET /expenses
  def index
    @expenses = current_user.expenses.order(created_at: :desc)
    @sum_expenses_current_month = current_user.sum_expenses_current_month
  end

  # GET /expenses/1
  def show
    @expense = current_user.expenses.find(params[:id])
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
    @expense = current_user.expenses.find(params[:id])
  end

  # POST /expenses
  def create
    @expense = current_user.expenses.new(expense_params)

    if @expense.save
      redirect_to expenses_url, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /expenses/1
  def update
    @expense = current_user.expenses.find(params[:id])
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /expenses/1
  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def expense_params
    params.require(:expense).permit(:user_id, :amount, :created_at, :description, category_ids: [])
  end
end
