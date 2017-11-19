class AddRateToAfps < ActiveRecord::Migration[5.1]
  def change
  	add_column :afps, :rate, :decimal, :precision => 2
  end
end
