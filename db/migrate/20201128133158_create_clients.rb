class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients, id: :string do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :job
      t.string :country
      t.string :address
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end
end
