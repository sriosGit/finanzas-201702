class RemoveRateFromAfps < ActiveRecord::Migration[5.1]
  def change
  	remove_column :afps, :rate
  end
end
