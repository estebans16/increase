class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.boolean :approved, default: false
      t.references :payment, null: false, foreign_key: true, index: true
      t.string :external_transaction_id

      t.timestamps
    end
  end
end
