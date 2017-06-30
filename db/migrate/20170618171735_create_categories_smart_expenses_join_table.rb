class CreateCategoriesSmartExpensesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :smart_expenses do |t|
      t.index [:smart_expense_id, :category_id], unique: true, name: 'index_categories_smart_expenses'
    end
  end
end
