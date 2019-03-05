class AddBalanceToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :balance, :integer, default: 0
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
  end
end
