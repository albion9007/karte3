class ChangeObservations3 < ActiveRecord::Migration[6.0]
  def change
    remove_column :observations, :hainyou, :string, null: false
    add_column :observations, :hainyou, :string
  end
end
