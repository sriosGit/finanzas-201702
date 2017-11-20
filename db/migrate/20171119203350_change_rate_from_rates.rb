class ChangeRateFromRates < ActiveRecord::Migration[5.1]
  def change
  	change_column :rates, :rate, :decimal, :precision => 7, :scale => 2
  end
end
