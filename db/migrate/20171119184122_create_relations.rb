class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.string :description

      t.timestamps
    end
  end
end
