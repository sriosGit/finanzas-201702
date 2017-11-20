class AddAfpIdToEntries < ActiveRecord::Migration[5.1]
  def change
  	add_column :entries, :afp_id, :integer
  end
end
