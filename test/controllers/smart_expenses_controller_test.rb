require 'test_helper'

class SmartExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:adam)
    @smart_expense = smart_expenses(:one)
  end

  test 'should get index' do
    get smart_expenses_url
    assert_response :success
  end

  test 'should get new' do
    get new_smart_expense_url
    assert_response :success
  end

  test 'should create smart_expense' do
    assert_difference('SmartExpense.count') do
      post smart_expenses_url, params: { smart_expense: { amount: @smart_expense.amount, description: @smart_expense.description, expression: @smart_expense.expression, user_id: @smart_expense.user_id } }
    end

    assert_redirected_to smart_expenses_url
  end

  test 'should show smart_expense' do
    get smart_expense_url(@smart_expense)
    assert_response :success
  end

  test 'should get edit' do
    get edit_smart_expense_url(@smart_expense)
    assert_response :success
  end

  test 'should update smart_expense' do
    patch smart_expense_url(@smart_expense), params: { smart_expense: { amount: @smart_expense.amount, description: @smart_expense.description, expression: @smart_expense.expression, user_id: @smart_expense.user_id } }
    assert_redirected_to smart_expense_url(@smart_expense)
  end

  test 'should destroy smart_expense' do
    assert_difference('SmartExpense.count', -1) do
      delete smart_expense_url(@smart_expense)
    end

    assert_redirected_to smart_expenses_url
  end
end
