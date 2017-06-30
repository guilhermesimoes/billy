class CreateSmartExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :smart_expenses do |t|
      t.references :user, foreign_key: true, null: false
      t.decimal :amount, precision: 8, scale: 2
      t.text :description
      t.string :expression, null: false
    end
  end
end
