class AddStatusToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :status, :boolean, default: false
  end
end
