class CreateAfps < ActiveRecord::Migration[5.1]
  def change
    create_table :afps do |t|
      t.string :description
      t.numeric :percentage

      t.timestamps
    end
  end
end
