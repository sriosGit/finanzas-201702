class AddRatesToAfps < ActiveRecord::Migration[5.1]
  def change
  	add_column :afps, :rate, :decimal, :precision => 7, :scale => 4
  end
end
