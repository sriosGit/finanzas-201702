class AddDetailToEntry < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :detail, :string
  end
end
