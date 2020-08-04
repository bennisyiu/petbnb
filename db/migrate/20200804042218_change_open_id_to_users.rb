class ChangeOpenIdToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :open_id, :string
  end
end
