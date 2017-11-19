class RemoveEntryTypeFromEntries < ActiveRecord::Migration[5.1]
  def change
  	remove_column :entries, :entry_type
  end
end
