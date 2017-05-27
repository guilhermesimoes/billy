class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.references :user, foreign_key: true, null: false
      t.money :amount, scale: 2, null: false
      t.text :description

      t.timestamps
    end
  end
end
