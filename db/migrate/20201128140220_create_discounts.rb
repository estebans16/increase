class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts, id: :string do |t|
      t.float :amount
      t.integer :discount_type
      t.references :payment, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
