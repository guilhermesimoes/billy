class CreateCategoriesExpensesJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :categories, :expenses do |t|
      t.index [:expense_id, :category_id], unique: true
    end
  end
end
