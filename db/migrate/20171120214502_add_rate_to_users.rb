class AddRateToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rate, :decimal, :precision => 7, :scale => 2
  end
end
