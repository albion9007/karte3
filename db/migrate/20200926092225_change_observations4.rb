class ChangeObservations4 < ActiveRecord::Migration[6.0]
  def change
    add_column :observations, :date, :date, null: false, default: Date.parse("2020/01/01")
  end
end
