class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :amount_in_cents

      t.timestamps null: false
    end
  end
end
