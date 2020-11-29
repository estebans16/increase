class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :string do |t|
      t.float :amount
      t.boolean :approved, default: false
      t.references :payment, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
