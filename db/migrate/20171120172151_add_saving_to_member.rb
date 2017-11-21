class AddSavingToMember < ActiveRecord::Migration[5.1]
  def change
	change_column :members, :savings, :decimal, :precision => 7, :scale => 2
  end
end
