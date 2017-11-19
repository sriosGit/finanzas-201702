class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :description
      t.decimal :rate, :precision => 2
      t.timestamps
    end
  end
end
