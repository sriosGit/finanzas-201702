class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :member, foreign_key: true
      t.numeric :amount
      t.string :entry_type

      t.timestamps
    end
  end
end
