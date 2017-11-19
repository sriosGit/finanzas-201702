class RemovePercentageFromAfp < ActiveRecord::Migration[5.1]
  def change
  	remove_column :afps, :percentage
  end
end
