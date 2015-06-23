class AddTokenToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :token, :string, unique: true
  end
end
