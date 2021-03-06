class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :currency
      t.float :total_amount
      t.float :total_discount
      t.float :total_with_discounts
      t.date :payment_date
      t.index :payment_date
      t.references :client, null: false, foreign_key: true, index: true
      t.string :external_payment_id

      t.timestamps
    end
  end
end
