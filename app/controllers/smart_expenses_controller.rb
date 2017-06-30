class SmartExpensesController < ApplicationController
  before_action :authenticate_user!

  # GET /smart_expenses
  def index
    @smart_expenses = current_user.smart_expenses
  end

  # GET /smart_expenses/1
  def show
    @smart_expense = current_user.smart_expenses.find(params[:id])
  end

  # GET /smart_expenses/new
  def new
    @smart_expense = SmartExpense.new
  end

  # GET /smart_expenses/1/edit
  def edit
    @smart_expense = current_user.smart_expenses.find(params[:id])
  end

  # POST /smart_expenses
  def create
    @smart_expense = current_user.smart_expenses.new(smart_expense_params)

    if @smart_expense.save
      redirect_to smart_expenses_url, notice: 'Smart expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /smart_expenses/1
  def update
    @smart_expense = current_user.smart_expenses.find(params[:id])
    if @smart_expense.update(smart_expense_params)
      redirect_to @smart_expense, notice: 'Smart expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /smart_expenses/1
  def destroy
    @smart_expense = current_user.smart_expenses.find(params[:id])
    @smart_expense.destroy
    redirect_to smart_expenses_url, notice: 'Smart expense was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def smart_expense_params
    params.require(:smart_expense).permit(:user_id, :amount, :description, :expression, category_ids: [])
  end
end
