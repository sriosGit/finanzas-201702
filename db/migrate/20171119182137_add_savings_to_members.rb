class AddSavingsToMembers < ActiveRecord::Migration[5.1]
  def change
  	add_column :members, :savings, :decimal, :precision => 2
  end
end
