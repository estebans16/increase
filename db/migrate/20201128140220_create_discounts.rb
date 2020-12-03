class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.float :amount
      t.integer :discount_type
      t.references :payment, null: false, foreign_key: true, index: true
      t.string :external_discount_id

      t.timestamps
    end
  end
end
