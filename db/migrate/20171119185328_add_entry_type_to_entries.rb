class AddEntryTypeToEntries < ActiveRecord::Migration[5.1]
  def change
  	add_column :entries, :entry_type, :integer
  end
end
